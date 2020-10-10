require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @movie = movies(:one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Movie.count' do
      post movies_path, params: { movies: { name: "シャンシャークの空に",
                                         content: "銀行副頭取のアンドリュー・デュフレーン（ティム・ロビンス）は、妻と愛人を射殺したという罪で、ショーシャンク刑務所に服役することに。彼は、他の服役囚となじめず、孤立していたが、調達屋のレッド（モーガン・フリーマン）と親しくなり、大掛かりな計画を密かに実行していく……。
主人公のアンディが降りしきる雨を全身で浴びる姿。雨を愛し、雨に愛される男が感じる開放感には手放しの感動を覚えてしまう。人間ドラマを得意とするフランク・ダラボン監督らしいこの名場面は涙なくしてみられないだろう。",
                                  screening_date: "1994-09-10",
                                         spoiler: false,
                                         user_id: 1,
                                     category_id: 11,
                                     movie_maxim: "脳と心で聴いていた。音楽は決して人から奪うことはできない。" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Movie.count'  do
      delete movie_path(@movie)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong movie" do
    log_in_as(users(:michael))
    movie = movies(:one)
    assert_no_difference 'Movie.count' do
      delete movie_path(movie)
    end
    assert_redirected_to root_url
  end

  test "should get show" do
    log_in_as(users(:michael))
    get movie_path(@movie)
    assert_match @movie.movie_maxim, response.body
    assert_match @movie.name, response.body
    assert_match @movie.content, response.body
  end

  test "should redirect comment_create when not logged in" do
    assert_no_difference 'MovieComment.count' do
      post movie_comment_create_path(@movie), params: { movie_comment: { comment: "面白い" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect comment_destroy when not logged in" do
    assert_no_difference 'MovieComment.count' do
      delete movie_comment_destroy_path(@movie), params: { movie_comment: { comment: "面白い" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect comment_destroy for wrong movie_comment" do
    log_in_as(users(:michael))
    movie_comment = movie_comments(:tau_manifesto)
    assert_no_difference 'MovieComment.count' do
      delete movie_comment_destroy_path(movie_comment)
    end
    assert_redirected_to root_url
  end
end
