require "test_helper"

class FrontOffice::FormsUploadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @form_upload = front_office_forms_uploads(:one)
  end

  test "should get index" do
    get front_office_forms_uploads_url
    assert_response :success
  end

  test "should get new" do
    get new_front_office_forms_upload_url
    assert_response :success
  end

  test "should create front_office_forms_upload" do
    assert_difference("FrontOffice::FormsUpload.count") do
      post front_office_forms_uploads_url, params: { front_office_forms_upload: {} }
    end

    assert_redirected_to front_office_forms_upload_url(FrontOffice::FormsUpload.last)
  end

  test "should show front_office_forms_upload" do
    get front_office_forms_upload_url(@form_upload)
    assert_response :success
  end

  test "should get edit" do
    get edit_front_office_forms_upload_url(@form_upload)
    assert_response :success
  end

  test "should update front_office_forms_upload" do
    patch front_office_forms_upload_url(@form_upload), params: { front_office_forms_upload: {} }
    assert_redirected_to front_office_forms_upload_url(@form_upload)
  end

  test "should destroy front_office_forms_upload" do
    assert_difference("FrontOffice::FormsUpload.count", -1) do
      delete front_office_forms_upload_url(@form_upload)
    end

    assert_redirected_to front_office_forms_uploads_url
  end
end
