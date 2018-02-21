json.boards @boards do |board|
  json.(board, :id, :content, :url, :created_at, :updated_at)
end