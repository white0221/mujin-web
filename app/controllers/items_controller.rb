# coding: utf-8
#
class ItemsController < ApplicationController
  before_action :signed_in_user, only: [:list, :add]
  before_action :admin_user, only: [:add, :delete, :update, :upgrade, :destroy]

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

    # itemかstockのどちらかのsaveがこけたらロールバック
    Item.transaction do
      @item.save

      created_item_id = @item["id"]
      stock_init_params = {
        "item_id": created_item_id,
                           "quantity": 0
      }
      @stock = Stock.new(stock_init_params)
      @stock.save

      flash[:success] = "商品を登録しました。"
      redirect_to '/item/list'
    end
    rescue => e
      flash[:danger] = "商品が登録できませんでした。"
      redirect_to '/item/add'
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
    destroy_item_id = params[:item_id]
    @item = Item.find(destroy_item_id)
    @stock = Stock.find_by(item_id: destroy_item_id)

    # stockかitemの削除がこけたらロールバック
    Item.transaction do
      @stock.destroy
      @item.destroy
    end
    flash[:notice] = "#{@item.name}を削除しました。"
    redirect_to '/item/list'
  end

  private
    def item_params
      params.require(:item).permit(:name, :value)
    end

  protect_from_forgery :except => [:create]
end
