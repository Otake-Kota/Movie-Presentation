require 'test_helper'

class MovieCommentsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user  = users(:michael)
    @movie = movies(:one)
  end

  test "movie_comment interface" do
    log_in_as(@user)
    get movie_path(@movie)


    assert_no_difference 'MovieComment.count' do
      post movie_comment_create_path(@movie), params: { movie_comment: { comment: "" } }
    end


    comment = "面白かった"
    assert_difference 'MovieComment.count', 1 do
      post movie_comment_create_path(@movie), params: { movie_comment: { comment: comment } }
    end
    assert_redirected_to movie_path(@movie)
    follow_redirect!
    assert_match comment, response.body


    assert_select 'a', text: '(削除)'
  end

  test "should comment a movie with Ajax" do
    log_in_as(@user)
    get movie_path(@movie)


    comment = "面白かった"
    assert_difference "MovieComment.count", 1 do
      post movie_comment_create_path(@movie), xhr: true, params: { movie_comment: { comment: comment } }
    end
  end
end
