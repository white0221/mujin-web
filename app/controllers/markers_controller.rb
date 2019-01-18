# coding: utf-8
class MarkersController < ApplicationController
  def new
    @marker = Marker.new
  end

  def create
    @marker = Marker.new(marker_params)
    if @marker.save
      flash[:success] = "マーカ画像が保存されました"
    else
      flash[:danger] = "入力エラー"
    end
  end

  private
  def marker_params
    params.require(:marker).permit(:url)
  end
end
