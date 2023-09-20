json.extract! journal, :id, :journal_date, :journal_narration, :created_at, :updated_at
json.url journal_url(journal, format: :json)
