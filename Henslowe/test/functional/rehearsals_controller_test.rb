require 'test_helper'

class RehearsalsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Rehearsal.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Rehearsal.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Rehearsal.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to rehearsal_url(assigns(:rehearsal))
  end

  def test_edit
    get :edit, :id => Rehearsal.first
    assert_template 'edit'
  end

  def test_update_invalid
    Rehearsal.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Rehearsal.first
    assert_template 'edit'
  end

  def test_update_valid
    Rehearsal.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Rehearsal.first
    assert_redirected_to rehearsal_url(assigns(:rehearsal))
  end

  def test_destroy
    rehearsal = Rehearsal.first
    delete :destroy, :id => rehearsal
    assert_redirected_to rehearsals_url
    assert !Rehearsal.exists?(rehearsal.id)
  end
end
