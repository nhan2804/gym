json.extract! product, :id, :name, :desc, :category_id, :price, :thumbnail, :created_at, :updated_at
json.url product_url(product, format: :json)
