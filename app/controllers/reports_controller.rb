class ReportsController < ApplicationController
  # GET /reports
  def index
    params.permit!
    @date = params[:report_date]
  end

  # POST /reports
  def create
    params.permit!

    @date = params['report_date'].empty? ? Date.today : Date.parse(params['report_date'])

    case params['report']
    when 'trial_balance'
      redirect_to reports_trial_balance_url date: @date
    end
  end

  # @todo: balance sheets are produced as at a date.  add date picker/as-at-date functionality
  def balance_sheet
    @date = Date::today
    unless params[:date].nil?
      @date = Date.parse params[:date]
    end

    @asset_accounts, @asset_balance = group_accounts "Asset", @date
    @liability_accounts, @liability_balance = group_accounts "Liability", @date
    @equity_accounts, @equity_balance = group_accounts "Equity", @date

    @total_assets_liabilities = Accounts::AccountBalance.new(balance: @asset_balance)
    @total_assets_liabilities.add @liability_balance

    @profit_loss_balance = Accounts::AccountBalance.new
    %w[Income Expense Revenue COGS].each do |account_type|
      Account.where(account_type: account_type).reject { |ac| ac.balance(date: @date).zero? }.each do |account|
        @profit_loss_balance.add account.balance(date: @date)
      end
    end

    @equity_balance.add @profit_loss_balance

    respond_to do |format|
      format.html {}
      format.json {}
      format.pdf  { redirect_to accounts_path }
    end
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

  def group_accounts account_type, date
    accounts = Account.where(account_type: account_type).reject { |account| account.balance(date: date).zero? }
    balance = Accounts::AccountBalance.new
    accounts.each { |account| balance.add account.balance(date: date) }
    [accounts, balance]
  end
end
