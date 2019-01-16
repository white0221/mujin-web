class ItemsController < ApplicationController
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
      params.require(:history).permit(:name, :value)
    end
end
