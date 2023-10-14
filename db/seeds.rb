# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

accounts = { 'Asset': ['Checking', 'Cash Drawer', 'Accounts Receivable', 'Prepaid Insurance', 'Inventory Asset',
                       'Store Equipment', 'Accum Depr, Equipment'],
             'Liability': ['Accounts Payable', 'Sales Tax Payable', 'Payroll Payable'],
             'Equity': ['Capital, Owner', 'Draw, Owner', 'Income Summary'],
             'Revenue': ['Books Sales Income', 'Giftware Sales Income', 'Keyboarding Sales Income',
                         'Supplies Sales Income', 'Returned Check Fee Income', 'Sales Discounts'],
             'Expense': ['Cost of Goods Sold', 'Bank Service Charges', 'Depreciation Expense',
                         'Insurance Expense - Fire', 'Insurance Expense - Liability', 'Payroll Expense', 'Rent Expense',
                         'telephone Expense', 'Utilities Expense', 'Misc Expense']
}

accounts.each_key do |key|
  accounts[key].each do |account|
    Account.create!(account_name: account, account_type: key)
  end
end