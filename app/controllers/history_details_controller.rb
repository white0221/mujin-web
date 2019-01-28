class HistoryDetailsController < ApplicationController
  before_action :signed_in_user
  def new
    @history_details = HistoryDetail.new
  end

  def create
    @history_detail = HistoryDetail.new(history_params)

    response_json = {}
    if @history_detail.save
      response_json["history_detail"] = @history_detail

      render json: response_json, status: :created
    else
      response_json["error"] = "invalid parameters"
      render json: response_json, status: :bad_request
    end
  end

  def read
    response_json = {}
    if params[:id]
      response_json["history_detail"] = HistoryDetail.find(params[:id])
    else
      response_json["history_details"] = HistoryDetail.all
    end

    render json: response_json, status: :ok
  end

  def list
    @history_details = HistoryDetail.where(history_id: params[:history_id])
  end

  private
    def history_params
      params.require(:history_detail).permit(:history_id, :item_id, :quantity)
    end

    protect_from_forgery :except => [:create]
end
