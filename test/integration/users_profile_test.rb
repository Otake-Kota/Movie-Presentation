require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "profile desplay" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.movies.count.to_s, response.body
    assert_select 'div.pagination'
    @user.movies.paginate(page: 1).each do |movie|
      assert_match movie.name, response.body
      assert_match movie.movie_maxim, response.body
      assert_match @user.name, response.body
    end
  end
end
