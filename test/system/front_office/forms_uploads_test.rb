require "application_system_test_case"

class FrontOffice::FormsUploadsTest < ApplicationSystemTestCase
  setup do
    @form_upload = front_office_forms_uploads(:one)
  end

  test "visiting the index" do
    visit front_office_forms_uploads_url
    assert_selector "h1", text: "Forms uploads"
  end

  test "should create forms upload" do
    visit front_office_forms_uploads_url
    click_on "New forms upload"

    click_on "Create Forms upload"

    assert_text "Forms upload was successfully created"
    click_on "Back"
  end

  test "should update Forms upload" do
    visit front_office_forms_upload_url(@form_upload)
    click_on "Edit this forms upload", match: :first

    click_on "Update Forms upload"

    assert_text "Forms upload was successfully updated"
    click_on "Back"
  end

  test "should destroy Forms upload" do
    visit front_office_forms_upload_url(@form_upload)
    click_on "Destroy this forms upload", match: :first

    assert_text "Forms upload was successfully destroyed"
  end
end
