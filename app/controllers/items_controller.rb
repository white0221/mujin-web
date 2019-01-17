class ItemsController < ApplicationController
  def history
    @detail =  HistoryDetail.joins(:history :item)
  end

  def list
    @items = Item.all
  end

  def google_request
  end
end
