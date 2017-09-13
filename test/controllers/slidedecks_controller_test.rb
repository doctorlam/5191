require 'test_helper'

class SlidedecksControllerTest < ActionController::TestCase
  setup do
    @slidedeck = slidedecks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slidedecks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slidedeck" do
    assert_difference('Slidedeck.count') do
      post :create, slidedeck: { title: @slidedeck.title }
    end

    assert_redirected_to slidedeck_path(assigns(:slidedeck))
  end

  test "should show slidedeck" do
    get :show, id: @slidedeck
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @slidedeck
    assert_response :success
  end

  test "should update slidedeck" do
    patch :update, id: @slidedeck, slidedeck: { title: @slidedeck.title }
    assert_redirected_to slidedeck_path(assigns(:slidedeck))
  end

  test "should destroy slidedeck" do
    assert_difference('Slidedeck.count', -1) do
      delete :destroy, id: @slidedeck
    end

    assert_redirected_to slidedecks_path
  end
end
