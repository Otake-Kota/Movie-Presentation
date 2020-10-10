require 'test_helper'

class MovieCommentTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @movie_comment = @user.movie_comments.build(comment: "これ見たことある", movie_id: 1)
  end

  test "should be valid" do
    assert @movie_comment.valid?
  end

  test "user id should be present" do
    @movie_comment.user_id = nil
    assert_not @movie_comment.valid?
  end

  test "movie id should be present" do
    @movie_comment.movie_id = nil
    assert_not @movie_comment.valid?
  end

  test "order should be most recent first" do
    assert_equal movie_comments(:most_recent), MovieComment.first
  end
end
