class ItemsController < ApplicationController
  def history
    @histories = History.all
    render :json => @histories
  end

  def list
    @items = Item.all
  end

  def google_request
  end
end
