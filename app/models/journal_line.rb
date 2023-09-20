class JournalLine < ApplicationRecord
  belongs_to :journal_id
  belongs_to :account_id
end
