json.extract! user, :id, :name, :date, :number, :description, :created_at, :updated_at
json.url user_url(user, format: :json)
