require "application_system_test_case"

class JournalLinesTest < ApplicationSystemTestCase
  setup do
    @journal_line = journal_lines(:one)
  end

  test "visiting the index" do
    visit journal_lines_url
    assert_selector "h1", text: "Journal lines"
  end

  test "should create journal line" do
    visit journal_lines_url
    click_on "New journal line"

    fill_in "Account id", with: @journal_line.account_id_id
    fill_in "Credit cents", with: @journal_line.credit_cents
    fill_in "Debit cents", with: @journal_line.debit_cents
    fill_in "Journal id", with: @journal_line.journal_id_id
    click_on "Create Journal line"

    assert_text "Journal line was successfully created"
    click_on "Back"
  end

  test "should update Journal line" do
    visit journal_line_url(@journal_line)
    click_on "Edit this journal line", match: :first

    fill_in "Account id", with: @journal_line.account_id_id
    fill_in "Credit cents", with: @journal_line.credit_cents
    fill_in "Debit cents", with: @journal_line.debit_cents
    fill_in "Journal id", with: @journal_line.journal_id_id
    click_on "Update Journal line"

    assert_text "Journal line was successfully updated"
    click_on "Back"
  end

  test "should destroy Journal line" do
    visit journal_line_url(@journal_line)
    click_on "Destroy this journal line", match: :first

    assert_text "Journal line was successfully destroyed"
  end
end
