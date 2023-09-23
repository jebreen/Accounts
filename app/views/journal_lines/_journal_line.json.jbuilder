json.extract! journal_line, :id, :journal_id, :account_id, :debit_cents, :credit_cents, :created_at, :updated_at
json.url journal_line_url(journal_line, format: :json)
