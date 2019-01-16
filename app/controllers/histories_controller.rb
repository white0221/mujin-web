class HistoriesController < ApplicationController
  def read
    @histories = History.all

    render json: @histories
  end

  private
    def history_params
      params.require(:history).permit(:user_id, :quantity, :response_flag)
    end
end
