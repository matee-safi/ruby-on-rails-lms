require "application_system_test_case"

class AcademicClassesTest < ApplicationSystemTestCase
  setup do
    @academic_class = academic_classes(:one)
  end

  test "visiting the index" do
    visit academic_classes_url
    assert_selector "h1", text: "Academic classes"
  end

  test "should create academic class" do
    visit academic_classes_url
    click_on "New academic class"

    fill_in "Name", with: @academic_class.name
    click_on "Create Academic class"

    assert_text "Academic class was successfully created"
    click_on "Back"
  end

  test "should update Academic class" do
    visit academic_class_url(@academic_class)
    click_on "Edit this academic class", match: :first

    fill_in "Name", with: @academic_class.name
    click_on "Update Academic class"

    assert_text "Academic class was successfully updated"
    click_on "Back"
  end

  test "should destroy Academic class" do
    visit academic_class_url(@academic_class)
    click_on "Destroy this academic class", match: :first

    assert_text "Academic class was successfully destroyed"
  end
end
