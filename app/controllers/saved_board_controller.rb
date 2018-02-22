class SavedBoardController < ApplicationController
  before_action :set_default_response_format

  def index
    @boards = SavedBoard.all
  end

  def show
    @board = SavedBoard.find_by_url(params[:url])
  end

  def create
    content = board_params[:content]

    @board =
      if SavedBoard.exists?(content: content)
        SavedBoard.find_by_content(content)
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
