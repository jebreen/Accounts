class CreateJournals < ActiveRecord::Migration[7.0]
  def change
    create_table :journals do |t|
      t.date :journal_date
      t.string :journal_narration

      t.timestamps
    end
  end
end
