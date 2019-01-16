class HistoriesController < ApplicationController
  def new
    @history = History.new
  end

  def create
    @history = History.new(history_params)

    response_json = {}
    if @history.save
      response_json["history"] = @history

      render json: response_json, status: :created
    else
      response_json["error"] = "invalid parameters"
      render json: response_json, status: :bad_request
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
