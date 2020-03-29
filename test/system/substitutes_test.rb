require "application_system_test_case"

class SubstitutesTest < ApplicationSystemTestCase
  setup do
    @substitute = substitutes(:one)
  end

  test "visiting the index" do
    visit substitutes_url
    assert_selector "h1", text: "Substitutes"
  end

  test "creating a Substitute" do
    visit substitutes_url
    click_on "New Substitute"

    fill_in "Changed at", with: @substitute.changed_at
    fill_in "Period", with: @substitute.period
    fill_in "Subject", with: @substitute.subject_id
    click_on "Create Substitute"

    assert_text "Substitute was successfully created"
    click_on "Back"
  end

  test "updating a Substitute" do
    visit substitutes_url
    click_on "Edit", match: :first

    fill_in "Changed at", with: @substitute.changed_at
    fill_in "Period", with: @substitute.period
    fill_in "Subject", with: @substitute.subject_id
    click_on "Update Substitute"

    assert_text "Substitute was successfully updated"
    click_on "Back"
  end

  test "destroying a Substitute" do
    visit substitutes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Substitute was successfully destroyed"
  end
end
