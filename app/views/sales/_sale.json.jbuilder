json.extract! sale, :id, :date_sale, :client_id, :state, :created_at, :updated_at
json.url sale_url(sale, format: :json)
