class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    # formからデータを受け取る
    @item = Item.new(item_params)

    # これを保存する
    @item.save

    # show.html.erbに飛ばす
    redirect_to "/items/#{@item.id}"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    # :idでItem.find
    @item = Item.find(params[:id])

    # データを更新
    @item.update_attributes(item_params)

    # show.html.erbへリダイレクト
    redirect_to "/items/#{@item.id}"
  end

  private

  def item_params
    # params.require(:key).permit(:filter)
    params.require(:item).permit(
      :name,
      :price,
      :seller_id,
      :description,
      :email,
      :image_url
    )
  end

end
