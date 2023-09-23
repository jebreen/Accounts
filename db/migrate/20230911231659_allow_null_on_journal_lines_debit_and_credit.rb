class AllowNullOnJournalLinesDebitAndCredit < ActiveRecord::Migration[7.0]
  def change
    change_column_null :journal_lines, :debit_cents, true
    change_column_null :journal_lines, :credit_cents, true
  end
end
