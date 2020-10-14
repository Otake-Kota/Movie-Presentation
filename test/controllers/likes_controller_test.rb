require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @movie = movies(:one)
    @user  = users(:michael)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Like.count' do
      post likes_path(@movie), params: { like: { movie_id: @movie.id, user_id: @user } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Like.count' do
      delete like_path(@movie)
    end
    assert_redirected_to login_url
  end
end
