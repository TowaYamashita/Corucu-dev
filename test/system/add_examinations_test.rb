require "application_system_test_case"

class AddExaminationsTest < ApplicationSystemTestCase
  setup do
    @add_examination = add_examinations(:one)
  end

  test "visiting the index" do
    visit add_examinations_url
    assert_selector "h1", text: "Add Examinations"
  end

  test "creating a Add examination" do
    visit add_examinations_url
    click_on "New Add Examination"

    fill_in "Category", with: @add_examination.category
    fill_in "Comment", with: @add_examination.comment
    fill_in "Place", with: @add_examination.place
    fill_in "Subject", with: @add_examination.subject_id
    click_on "Create Add examination"

    assert_text "Add examination was successfully created"
    click_on "Back"
  end

  test "updating a Add examination" do
    visit add_examinations_url
    click_on "Edit", match: :first

    fill_in "Category", with: @add_examination.category
    fill_in "Comment", with: @add_examination.comment
    fill_in "Place", with: @add_examination.place
    fill_in "Subject", with: @add_examination.subject_id
    click_on "Update Add examination"

    assert_text "Add examination was successfully updated"
    click_on "Back"
  end

  test "destroying a Add examination" do
    visit add_examinations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Add examination was successfully destroyed"
  end
end
