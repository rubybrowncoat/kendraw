class SharedBoardController < ApiController
  before_action :set_default_response_format

  COLORS = [
    '#FFF',
    '#000',
    '#F00',
    '#0F0',
    '#00F',
    '#0FF',
    '#FF0',
    '#F0F',
  ]

  def index
    @boards = SharedBoard.all
  end

  def show
    @board = SharedBoard.find_by_url(params[:url])
  end

  def preview
    board = SharedBoard.find_by_url(params[:url])

    key_height = 3
    key_width = 7

    _, pre_size = board.content.split(';')

    keyboard_width, keyboard_height = pre_size.split('#').second.split('-')
    grid_width = key_width * keyboard_width.to_i
    grid_height = key_height * keyboard_height.to_i

    return unless board.shared_actives.length

    png = ChunkyPNG::Image.new(
      grid_width,
      grid_height,
      ChunkyPNG::Color.from_hex('#444')
    )

    board.shared_actives.each do |active|
      png[active.left, active.top] = ChunkyPNG::Color.from_hex COLORS[active.status.to_i]
    end

    send_data png.to_blob, disposition: 'inline', type: 'image/png'
  end

  def create
    @board = SharedBoard.create!(board_params)
  end

  private

  def board_params
    params.permit(:content)
  end

  protected

  def set_default_response_format
    request.format = :json
  end
end
