require 'test_helper'

class NichesControllerTest < ActionController::TestCase
  setup do
    @nich = niches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:niches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nich" do
    assert_difference('Niche.count') do
      post :create, nich: { description: @nich.description, title: @nich.title }
    end

    assert_redirected_to nich_path(assigns(:nich))
  end

  test "should show nich" do
    get :show, id: @nich
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nich
    assert_response :success
  end

  test "should update nich" do
    put :update, id: @nich, nich: { description: @nich.description, title: @nich.title }
    assert_redirected_to nich_path(assigns(:nich))
  end

  test "should destroy nich" do
    assert_difference('Niche.count', -1) do
      delete :destroy, id: @nich
    end

    assert_redirected_to niches_path
  end
end
