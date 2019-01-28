# coding: utf-8
class StocksController < ApplicationController
  before_action :signed_in_user
  def new
    @stock = Stock.new
  end

  def list
    @stocks = Stock.all
  end

  def update
    @stock = Stock.find(params[:id])
  end

  def create
    @stock = Stock.new(stock_params)

    response_json = {}
    if @stock.save
      response_json["stock"] = @stock

      render json: response_json, status: :created
    else
      response_json["error"] = "invalid parameters"
      render json: response_json, status: :bad_request
    end
  end

  def upgrade
    if !params[:data]
      flash[:danger] = "入力エラー"
      redirect_to "/stock/update"
    end

    stock = Stock.find(params[:data])
    stock.item_id = params[:stock][:item_id]
    stock.quantity = params[:stock][:quantity]

    response_json = {}
    if stock.save
      flash[:success] = "在庫情報を更新しました"
      redirect_to "/stock/list"
    else
      flash[:danger] = "入力エラー"
      redirect_to "/stock/update"
    end
  end

  def upgrade_for_api
    if !params[:id]
      response_json["error"] = "invalid quantity update"

      render json: response_json, status: :bad_request
    end

    stock = Stock.find(params[:id])
    stock.quantity = params[:stock][:quantity]

    response_json = {}
    if stock.save
      response_json["stock"] = stock

      render json: response_json, status: :accepted
    else
      response_json["error"] = "invalid quantity update"

      render json: response_json, status: :bad_request
    end
  end

  def read
    response_json = {}
    if params[:id]
      response_json["stock"] = Stock.find(params[:id])
    else
      response_json["stocks"] = Stock.all
    end

    render json: response_json, status: :ok
  end

  private
    def stock_params
      params.require(:stock).permit(:item_id, :quantity)
    end

    def stock_params_for_update
      params.require(:stock).permit(:quantity)
    end

  protect_from_forgery :except => [:create]
end
