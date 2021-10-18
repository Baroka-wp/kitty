json.extract! profil, :id, :name, :bio, :telephone, :status, :document, :doc_type, :user, :created_at, :updated_at
json.url profil_url(profil, format: :json)
