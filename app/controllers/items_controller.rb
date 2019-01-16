class ItemsController < ApplicationController

  def new
    @history = History.new
  end

  def create
    @item = Item.new(item_params)

    response_json = {}
    if @item.save
      response_json["item"] = @item

      render json: response_json, status: :created
    else
      response_json["error"] = "invalid parameters"
      render json: response_json, status: :bad_request
    end
  end

  def read
    response_json = {}
    if params[:id]
      response_json["item"] = Item.find(params[:id])
    else
      response_json["items"] = Item.all
    end

    render json: response_json, status: :ok
  end

  private
    def item_params
      params.require(:item).permit(:name, :value)
    end

  protect_from_forgery :except => [:create]
end
