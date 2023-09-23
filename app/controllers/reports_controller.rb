class ReportsController < ApplicationController
  def index

  end

  def balance_sheet
    @asset_accounts, @asset_balance = group_accounts "Asset"
    @liability_accounts, @liability_balance = group_accounts "Liability"
    @equity_accounts, @equity_balance = group_accounts "Equity"

    @total_assets_liabilities = Accounts::AccountBalance.new(balance: @asset_balance)
    @total_assets_liabilities.add @liability_balance

    @profit_loss_balance = Accounts::AccountBalance.new
    %w[Income Expense Revenue COGS].each do |account_type|
      Account.where(account_type: account_type).reject { |ac| ac.balance.zero? }.each do |account|
        @profit_loss_balance.add account.balance
      end
    end

    @equity_balance.add @profit_loss_balance
  end

  def trial_balance
    @accounts = Account.order(:account_type, :account_name).reject { |account| account.balance.zero? }

    @debit_total = Money.new(0)
    @credit_total = Money.new(0)

    @accounts.each do |account|
      @debit_total += account.balance.debit
      @credit_total += account.balance.credit
    end
  end

  def profit_loss
    @revenue_accounts, @revenue_balance = group_accounts "Revenue"
    @cogs_accounts, @cogs_balance = group_accounts "COGS"

    @gross_profit = Accounts::AccountBalance.new(balance: @revenue_balance)
    @gross_profit.add(@cogs_balance)

    @income_accounts, @income_balance = group_accounts "Income"
    @expense_accounts, @expense_balance = group_accounts "Expense"

    @net_profit = Accounts::AccountBalance.new balance: @gross_profit
    @net_profit.add @income_balance
    @net_profit.add @expense_balance
  end

  def group_accounts account_type
    accounts = Account.where(account_type: account_type).reject { |account| account.balance.zero? }
    balance = Accounts::AccountBalance.new
    accounts.each { |account| balance.add account.balance }
    [accounts, balance]
  end
end
