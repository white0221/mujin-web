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

  def list
    # idsパラメータがある場合,idsの指定するidをもつマーカのみを返す
    # idの重複があった場合、重複を許す
    if params[:ids]
      ids =  JSON.parse(params[:ids])
      all_markers = Marker.all

      # idによる絞り込みを行う
      # whereを利用すると重複が許されないため
      # 繰り返して@markersを生成する
      @markers = []
      ids.each do | id |
        if all_markers[id-1]
          @markers.push(all_markers[id-1])
        end
      end
    else
      @markers = Marker.all
    end
  end

  private
  def marker_params
    params.require(:marker).permit(:url)
  end
end
