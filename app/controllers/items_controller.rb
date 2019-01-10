class ItemsController < ApplicationController
  def history
  end

  def list
    @items = Item.all
  end

  def google_request
  end
end
