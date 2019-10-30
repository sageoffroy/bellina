json.extract! client, :id, :dni, :fullname, :mail, :telephone, :address, :created_at, :updated_at
json.url client_url(client, format: :json)
