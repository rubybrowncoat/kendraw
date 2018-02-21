if @board
  json.(@board, :id, :content, :url, :created_at, :updated_at)
end