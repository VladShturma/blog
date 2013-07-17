require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  def setup
    posts(:one).comments << comments(:one)
  end

  test "should create comment" do
    assert_difference('posts(:one).comments.count') do
      post :create, post_id: posts(:one).id, comment: {commenter: "Vlad Shturma", body: "My comment"}
    end
    assert_redirected_to post_path(assigns(:post))
  end

  test "should delete comment" do
    authenticate
    assert_difference('posts(:one).comments.count', -1) do
      delete :destroy, post_id: posts(:one).id, id: comments(:one).id
    end
  end

end
