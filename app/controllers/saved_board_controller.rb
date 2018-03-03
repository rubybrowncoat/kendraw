class SavedBoardController < ApiController
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
    @boards = SavedBoard.all
  end

  def show
    @board = SavedBoard.find_by_url(params[:url])
  end

  def preview
    board = SavedBoard.find_by_url(params[:url])

    key_height = 3
    key_width = 7

    _, pre_size, pre_actives = board.content.split(';')

    keyboard_width, keyboard_height = pre_size.split('#').second.split('-')
    grid_width = key_width * keyboard_width.to_i
    grid_height = key_height * keyboard_height.to_i

    pre_actives_expansion = pre_actives.split('#').second

    pre_actives_string = pre_actives_expansion.gsub(/\:(.)(\d+)\:/) do
      match = Regexp.last_match
      match[1] * match[2].to_i
    end

    return unless pre_actives_string.length

    png = ChunkyPNG::Image.new(
      grid_width,
      grid_height,
      ChunkyPNG::Color.from_hex('#444')
    )

    pre_actives_string.each_char.with_index do |char, index|
      if char != '*'
        left = index % grid_width
        top = (index / grid_width).floor

        png[left, top] = ChunkyPNG::Color.from_hex COLORS[char.to_i]
      end
    end

    send_data png.to_blob, disposition: 'inline', type: 'image/png'
  end

  def create
    content = board_params[:content]

    @board =
      if (found = SavedBoard.find_by_content(content))
        found
      else
        SavedBoard.create!(board_params)
      end
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
