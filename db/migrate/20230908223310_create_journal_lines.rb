class CreateJournalLines < ActiveRecord::Migration[7.0]
  def change
    create_table :journal_lines do |t|
      t.references :journal_id, null: false, foreign_key: true
      t.references :account_id, null: false, foreign_key: true
      t.integer :debit_cents
      t.integer :credit_cents

      t.timestamps
    end
  end
end
