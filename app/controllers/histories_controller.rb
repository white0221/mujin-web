class HistoriesController < ApplicationController
  def new
    @history = History.new
  end

  def create
    @history = History.new(history_params)
    if @history.save
      render json: @history
    else
      render json: @history
    end
  end

  def read
    @histories = History.all

    render json: @histories
  end

  private
    def history_params
      params.require(:history).permit(:user_id, :quantity, :response_flag)
    end

    protect_from_forgery :except => [:create]
end
