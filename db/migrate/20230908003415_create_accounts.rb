class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.integer :type
      t.boolean :contra
      t.string :name

      t.timestamps
    end
  end
end
