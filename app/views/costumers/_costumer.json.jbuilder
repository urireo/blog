json.extract! costumer, :id, :first_name, :last_name, :phone, :email, :created_at, :updated_at
json.url costumer_url(costumer, format: :json)
