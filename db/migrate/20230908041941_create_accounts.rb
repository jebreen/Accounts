class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.integer :account_type
      t.string :account_name
      t.boolean :account_contra

      t.timestamps
    end
  end
end
