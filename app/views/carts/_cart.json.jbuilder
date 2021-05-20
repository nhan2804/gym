json.extract! cart, :id, :users_id, :products_id, :quantity_id, :created_at, :updated_at
json.url cart_url(cart, format: :json)
