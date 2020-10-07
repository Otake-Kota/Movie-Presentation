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
end
