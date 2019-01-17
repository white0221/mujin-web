# coding: utf-8
#
class ItemsController < ApplicationController

  def new
    @item = Item.new
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
    redirect_to '/item/list'
  end

  def add
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "商品を登録しました。"
    else
      flash[:danger] = "商品が登録できませんでした。"
    end
    redirect_to '/item/list'
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
    redirect_to '/item/list'
  end

  def destroy
    item = Item.find(params[:item_id]).destroy
    flash[:notice] = "#{item.name}を削除しました。"
    redirect_to '/item/list'
  end

  private
    def item_params
      params.require(:item).permit(:name, :value)
    end

  protect_from_forgery :except => [:create]
end
