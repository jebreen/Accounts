require "test_helper"

class JournalLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @journal_line = journal_lines(:one)
  end

  test "should get index" do
    get journal_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_journal_line_url
    assert_response :success
  end

  test "should create journal_line" do
    assert_difference("JournalLine.count") do
      post journal_lines_url, params: { journal_line: { account_id: @journal_line.account_id, credit_cents: @journal_line.credit_cents, debit_cents: @journal_line.debit_cents, journal_id: @journal_line.journal_id } }
    end

    assert_redirected_to journal_line_url(JournalLine.last)
  end

  test "should show journal_line" do
    get journal_line_url(@journal_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_journal_line_url(@journal_line)
    assert_response :success
  end

  test "should update journal_line" do
    patch journal_line_url(@journal_line), params: { journal_line: { account_id: @journal_line.account_id, credit_cents: @journal_line.credit_cents, debit_cents: @journal_line.debit_cents, journal_id: @journal_line.journal_id } }
    assert_redirected_to journal_line_url(@journal_line)
  end

  test "should destroy journal_line" do
    assert_difference("JournalLine.count", -1) do
      delete journal_line_url(@journal_line)
    end

    assert_redirected_to journal_lines_url
  end
end
