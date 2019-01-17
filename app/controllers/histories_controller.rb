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
    response_json = {}
    if params[:id]
      response_json["history"] = History.find(params[:id])
    else
      response_json["histories"] = History.all
    end

    render json: response_json, status: :ok
  end

  def read_with_user_id
    response_json = {}
    if params[:id]
      response_json["histories"] = History.where(user_id: params[:id])

      render json: response_json, status: :ok
    else
      response_json["error"] = "parameter don't have user_id"

      render json: response_json, status: :bad_requrest
    end
  end

  private
    def history_params
      params.require(:history).permit(:user_id, :quantity, :response_flag)
    end

    protect_from_forgery :except => [:create]
end
