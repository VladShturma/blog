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

  test "should show all posts" do
    get :index
    assert_response :success
  end

  test "should update post" do
    authenticate
    get :update, id: @post.id, post: {title: 'Hello', text: 'This is my first post.'}
    assert_redirected_to post_path(assigns(:post))
    assert_equal('Hello',assigns(:post).title)
    assert_equal('This is my first post.',assigns(:post).text)
  end

  test "should destroy post" do
    authenticate
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post.id
    end
    assert_redirected_to posts_path
  end

end
