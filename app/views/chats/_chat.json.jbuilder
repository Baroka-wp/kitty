json.extract! chat, :id, :message, :product_id, :created_at, :updated_at
json.url chat_url(chat, format: :json)
