require File.dirname(__FILE__) + '/../test_helper'
require 'text_slots_controller'

# Re-raise errors caught by the controller.
class TextSlotsController; def rescue_action(e) raise e end; end

class TextSlotsControllerTest < Test::Unit::TestCase
  fixtures :text_slots

  def setup
    @controller = TextSlotsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:text_slots)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_text_slot
    old_count = TextSlot.count
    post :create, :text_slot => { }
    assert_equal old_count+1, TextSlot.count
    
    assert_redirected_to text_slot_path(assigns(:text_slot))
  end

  def test_should_show_text_slot
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_text_slot
    put :update, :id => 1, :text_slot => { }
    assert_redirected_to text_slot_path(assigns(:text_slot))
  end
  
  def test_should_destroy_text_slot
    old_count = TextSlot.count
    delete :destroy, :id => 1
    assert_equal old_count-1, TextSlot.count
    
    assert_redirected_to text_slots_path
  end
end
