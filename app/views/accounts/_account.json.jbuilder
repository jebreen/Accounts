json.extract! account, :id, :account_type, :account_name, :account_contra, :created_at, :updated_at
json.url account_url(account, format: :json)
