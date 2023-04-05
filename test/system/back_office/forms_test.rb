require "application_system_test_case"

class BackOffice::FormsTest < ApplicationSystemTestCase
  setup do
    @form = back_office_forms(:one)
  end

  test "visiting the index" do
    visit back_office_forms_url
    assert_selector "h1", text: "Forms"
  end

  test "should create form" do
    visit back_office_forms_url
    click_on "New form"

    fill_in "Description", with: @form.description
    fill_in "Title", with: @form.title
    click_on "Create Form"

    assert_text "Form was successfully created"
    click_on "Back"
  end

  test "should update Form" do
    visit back_office_form_url(@form)
    click_on "Edit this form", match: :first

    fill_in "Description", with: @form.description
    fill_in "Title", with: @form.title
    click_on "Update Form"

    assert_text "Form was successfully updated"
    click_on "Back"
  end

  test "should destroy Form" do
    visit back_office_form_url(@form)
    click_on "Destroy this form", match: :first

    assert_text "Form was successfully destroyed"
  end
end
