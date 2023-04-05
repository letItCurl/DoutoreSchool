require "test_helper"

class BackOffice::FormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @form = back_office_forms(:one)
  end

  test "should get index" do
    get back_office_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_back_office_form_url
    assert_response :success
  end

  test "should create back_office_form" do
    assert_difference("BackOffice::Form.count") do
      post back_office_forms_url, params: { back_office_form: { description: @form.description, title: @form.title } }
    end

    assert_redirected_to back_office_form_url(BackOffice::Form.last)
  end

  test "should show back_office_form" do
    get back_office_form_url(@form)
    assert_response :success
  end

  test "should get edit" do
    get edit_back_office_form_url(@form)
    assert_response :success
  end

  test "should update back_office_form" do
    patch back_office_form_url(@form), params: { back_office_form: { description: @form.description, title: @form.title } }
    assert_redirected_to back_office_form_url(@form)
  end

  test "should destroy back_office_form" do
    assert_difference("BackOffice::Form.count", -1) do
      delete back_office_form_url(@form)
    end

    assert_redirected_to back_office_forms_url
  end
end
