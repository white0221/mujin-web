class HistoriesController < ApplicationController
  def read
    @histories = History.all

    render json: @histories
  end
end
