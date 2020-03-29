require 'test_helper'

class AddExaminationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @add_examination = add_examinations(:one)
  end

  test "should get index" do
    get add_examinations_url
    assert_response :success
  end

  test "should get new" do
    get new_add_examination_url
    assert_response :success
  end

  test "should create add_examination" do
    assert_difference('AddExamination.count') do
      post add_examinations_url, params: { add_examination: { category: @add_examination.category, comment: @add_examination.comment, place: @add_examination.place, subject_id: @add_examination.subject_id } }
    end

    assert_redirected_to add_examination_url(AddExamination.last)
  end

  test "should show add_examination" do
    get add_examination_url(@add_examination)
    assert_response :success
  end

  test "should get edit" do
    get edit_add_examination_url(@add_examination)
    assert_response :success
  end

  test "should update add_examination" do
    patch add_examination_url(@add_examination), params: { add_examination: { category: @add_examination.category, comment: @add_examination.comment, place: @add_examination.place, subject_id: @add_examination.subject_id } }
    assert_redirected_to add_examination_url(@add_examination)
  end

  test "should destroy add_examination" do
    assert_difference('AddExamination.count', -1) do
      delete add_examination_url(@add_examination)
    end

    assert_redirected_to add_examinations_url
  end
end
