class HistoriesController < ApplicationController
  before_action :signed_in_user, only: [:list]
  def new
    @history = History.new
  end

  def create
    @history = History.new(history_params)

    history_details = []
    response_json = {}
    success = false
    History.transaction do
      @history.save
      created_history_id = @history.id

      history_details_params["history_details"].each do | history_detail_params |
        history_detail_params["history_id"] = created_history_id
        @history_detail = HistoryDetail.new(history_detail_params)
        @history_detail.save
        history_details.push(@history_detail)
      end
      response_json["history"] = @history
      response_json["history_detail"] = history_details

      success = true
    end

    if success
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
    if params[:user_id]
      response_json["histories"] = History.where(user_id: params[:user_id])
      render json: response_json, status: :ok
    else
      response_json["error"] = "parameter don't have user_id"

      render json: response_json, status: :bad_requrest
    end
  end

  def list
    @histories = History.where(user_id: current_user.id)
  end

  private
    def history_params
      params.require(:history).permit(:user_id, :response_flag)
    end

    def history_details_params
      params.require(:history).permit(history_details: [:item_id, :volume])
    end

    protect_from_forgery :except => [:create]
end
