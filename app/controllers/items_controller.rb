#
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
      response_json["items"] =Item.all
    end

    render json: response_json, status: :ok
  end

  def list
    @items = Item.all
  end

  def update
    @item = Item.find(params[:id])
  end

  def delete
    @item = Item.find(params[:id])
  end

  def upgrade
    item = Item.find(params[:data])
    item.name = params[:item][:name]
    item.value = params[:item][:value]
    if item.save(validate: false)
      #success
      p 'update ok'
    else
      #err
      p 'update err'
    end
    flash[:notice] = "#{item.name}の情報を更新しました。"
    redirect_to '/item_list'
  end

  def destroy
    user = User.find(params[:user_id]).destroy
    flash[:notice] = "#{item.name}を削除しました。"
    redirect_to '/item_list'
  end

  private
    def item_params
      params.require(:item).permit(:name, :value)
    end

  protect_from_forgery :except => [:create]
end
