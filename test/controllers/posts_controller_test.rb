require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  def setup
    @post = posts(:one)
  end

  test "should show post" do
    get :show, id: @post.id
    assert_response :success
  end

  test "should create post" do
    authenticate
    assert_difference('Post.count') do
      post :create, post: {title: 'Hello', text: 'This is my first post.'}
    end
    assert_redirected_to post_path(assigns(:post))
  end

end
