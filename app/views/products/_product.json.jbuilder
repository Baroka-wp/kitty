json.extract! product, :id, :title, :description, :price, :image_url, :category_id, :subcategory_id, :created_at, :updated_at
json.url product_url(product, format: :json)
