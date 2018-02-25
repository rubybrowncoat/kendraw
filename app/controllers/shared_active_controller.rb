class SharedActiveController < ApiController
  before_action :set_default_response_format

  def index
    @board = SharedBoard.find_by_url(params[:url])
  end

  def create
    @board = SharedBoard.find_by_url(params[:url])

    relation = SharedActive.where(
      shared_board: @board,
      top: active_params[:top],
      left: active_params[:left]
    )

    if active_params[:status] == -1
      relation.destroy_all
    else
      @active =
        if (incumbent = relation.first).nil?
          relation.create!(active_params)
        else
          incumbent.update_attributes(active_params)
          incumbent
        end
    end

    ActionCable.server.broadcast(
      'shared_actives',
      board: @board.url,
      active: {
        top: active_params[:top],
        left: active_params[:left],
        status: active_params[:status]
      }
    )
  end

  private

  def active_params
    params.permit(:top, :left, :status)
  end

  protected

  def set_default_response_format
    request.format = :json
  end
end
