require 'test_helper'

class BoxesControllerTest < ActionController::TestCase
  setup do
    @box = boxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create box" do
    assert_difference('Box.count') do
      post :create, box: { category_id: @box.category_id, codigo: @box.codigo, descripcion: @box.descripcion, fecha: @box.fecha, precinto_A: @box.precinto_A, precinto_B: @box.precinto_B, sector_id: @box.sector_id, ubicacion: @box.ubicacion }
    end

    assert_redirected_to box_path(assigns(:box))
  end

  test "should show box" do
    get :show, id: @box
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @box
    assert_response :success
  end

  test "should update box" do
    patch :update, id: @box, box: { category_id: @box.category_id, codigo: @box.codigo, descripcion: @box.descripcion, fecha: @box.fecha, precinto_A: @box.precinto_A, precinto_B: @box.precinto_B, sector_id: @box.sector_id, ubicacion: @box.ubicacion }
    assert_redirected_to box_path(assigns(:box))
  end

  test "should destroy box" do
    assert_difference('Box.count', -1) do
      delete :destroy, id: @box
    end

    assert_redirected_to boxes_path
  end
end
