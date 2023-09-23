
class Account < ApplicationRecord
  has_many :journal_lines
  enum account_type: [:Asset, :Liability, :Equity, :Revenue, :Income, :COGS, :Expense]

  def balance date = Date.today
    result = Accounts::AccountBalance.new

    JournalLine.where(account_id: id).joins(:journal).where(journals: {journal_date: ..date }).each do |line|
      result.add Accounts::AccountBalance.new(debit: line.debit, credit: line.credit)
    end

    result
  end
end
