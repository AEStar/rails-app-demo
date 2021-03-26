json.extract! room, :id, :address, :price, :beds, :square, :assigned, :created_at, :updated_at
json.url room_url(room, format: :json)
