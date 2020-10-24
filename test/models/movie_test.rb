require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @movie = @user.movies.build(name: "ハリーポッターと賢者の石",
                             content: "不思議な世界観に引き込まれます。",
                         category_id: 2,
                             spoiler: false,
                      screening_date: '2001-11-16',
                    movie_maxim: "おまえは”生き残った男の子”なんだ")
  end

  test "should be valid" do
    assert @movie.valid?
  end

  test "user id should be present" do
    @movie.user_id = nil
    assert_not @movie.valid?
  end

  test "category id should be present" do
    @movie.category_id = nil
    assert_not @movie.valid?
  end

  test "content should be present" do
    @movie.content = "     "
    assert_not @movie.valid?
  end

  test "name should be present" do
    @movie.name = "     "
    assert_not @movie.valid?
  end

  test "spoiler should be present" do
    @movie.spoiler = nil
    assert_not @movie.valid?
  end

  test "movie_maxim should be present" do
    @movie.movie_maxim = "    "
    assert_not @movie.valid?
  end

end
