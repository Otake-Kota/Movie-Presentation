require 'test_helper'

class MoviesNewTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)

    @name           = "ハリーポッターと賢者の石"
    @content        = "不思議な世界観に引き込まれます"
    @screening_date = '2001-11-16'
    @spoiler        = false
    @category_id    = 1
    @movie_maxim    = Faker::Lorem.sentence(1)
  end

  test "movie interface" do
    log_in_as(@user)
    get new_movie_path
    assert_template "movies/new"
    assert_no_difference 'Movie.count' do
      post movies_path, params: { movie: { content: "" } }
    end
    assert_select 'div#error_explanation'
    assert_template "movies/new"


    assert_difference 'Movie.count', 1 do
      post movies_path, params: { movie: { name: @name,
                                         content: @content,
                                  screening_date: @screening_date,
                                         spoiler: @spoiler,
                                     category_id: @category_id,
                                     movie_maxim: @movie_maxim } }
    end
    assert_redirected_to root_url
    follow_redirect!
    get user_path(@user)
    assert_match @movie_maxim, response.body


    assert_select 'a', text: '(投稿を削除する)'
    first_movie = @user.movies.paginate(page: 1).first
    assert_difference 'Movie.count', -1 do
      delete movie_path(first_movie)
    end


    get user_path(users(:archer))
    assert_select 'a', text: '(投稿を削除する)', count: 0
  end
end
