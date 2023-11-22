require "test_helper"

class AcademicClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @academic_class = academic_classes(:one)
  end

  test "should get index" do
    get academic_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_academic_class_url
    assert_response :success
  end

  test "should create academic_class" do
    assert_difference("AcademicClass.count") do
      post academic_classes_url, params: { academic_class: { name: @academic_class.name } }
    end

    assert_redirected_to academic_class_url(AcademicClass.last)
  end

  test "should show academic_class" do
    get academic_class_url(@academic_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_academic_class_url(@academic_class)
    assert_response :success
  end

  test "should update academic_class" do
    patch academic_class_url(@academic_class), params: { academic_class: { name: @academic_class.name } }
    assert_redirected_to academic_class_url(@academic_class)
  end

  test "should destroy academic_class" do
    assert_difference("AcademicClass.count", -1) do
      delete academic_class_url(@academic_class)
    end

    assert_redirected_to academic_classes_url
  end
end
