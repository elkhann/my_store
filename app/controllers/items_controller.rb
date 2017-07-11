class ItemsController < ApplicationController

  def index
      @items = Item.all
  end

  # /items/1 GET
  def show
    unless @item = Item.where(id: params[:id]).first
      render plain: "Page not found", status: 404
    end
  end

  # /items/new GET
  def new
    @item = Item.new
  end

  # /items/1/edit GET
  def edit
    @item = Item.find(params[:id])
  end

  # /items POST
  def create
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "new"
    end
  end

  # /items/1 PUT
  def update
    @item = Item.find(params[:id])
    @item.update_attributes(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "edit"
    end
  end

  # /items/1 DELETE
  def destroy

  end

  private

  def item_params
    params.require(:item).permit(:price, :name, :description, :weight)
  end

end