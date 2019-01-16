class StocksController < ApplicationController
  def new
    @history = Stock.new
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
    params.require(:stock).permit(:quantity)
  end

  protect_from_forgery :except => [:create]
end
