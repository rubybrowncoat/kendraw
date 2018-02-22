json.call(board, :id, :content, :url, :created_at, :updated_at)
json.actives board.shared_actives, partial: 'shared_board/active', as: :active
