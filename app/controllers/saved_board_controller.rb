class SavedBoardController < ApplicationController
  before_action :set_default_response_format

  def index
    @boards = SavedBoard.all
  end

  def show
    @board = SavedBoard.find_by_url(params[:url])
  end

  def create
    if SavedBoard.exists?(:content => board_params[:content])
      @board = SavedBoard.find_by_content(board_params[:content])
    else
      @board = SavedBoard.create!(board_params)
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
