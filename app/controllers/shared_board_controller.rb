class SharedBoardController < ApiController
  before_action :set_default_response_format

  def index
    @boards = SharedBoard.all
  end

  def show
    @board = SharedBoard.find_by_url(params[:url])
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
