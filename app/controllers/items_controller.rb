# frozen_string_literal: true

class ItemsController < ApplicationController
  @@arr = []
  def index
    @items = Item.all
    @user = User.find(1)

    respond_to do |format|
      format.html
      format.csv { send_data @items.to_csv, filename: "items-#{DateTime.now.strftime('%d%m%Y%H%M')}.csv" }
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      ChangeItemMailer.create_noti(@item).deliver_now
      redirect_to action: 'index'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      ChangeItemMailer.upd_noti(@item).deliver_now
      redirect_to action: 'index'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to action: 'index'
  end

  def buy
    # byebug
    # @item=Item.find(params[:id])
    # @order=Order.find(1)
    # @order.items<<@item
    # redirect_to action: "index"

    # byebug
    @item = Item.find(params[:id])
    @@arr.push(@item)
    redirect_to action: 'index'
  end

  def export_csv
    @items = Item.all
    respond_to do |format|
      format.html
      format.csv { send_data @items.to_csv, filename: "items-#{DateTime.now.strftime('%d%m%Y%H%M')}.csv" }
    end
  end

  def show_list
    # byebug
    @@arr
    # @item = @arr[]
    # @item.destroy
    # redirect_to action: "index"
    @items = @@arr
    # @order=Order.find(1)

    # @items=@order.items
  end

  def confirmorder
    # byebug
    @@arr
    a = @@arr.empty?
    if a != true
      @order = Order.create(name: 'shreesh', totalprice: 1000)
      @order.items << @@arr
      @items = @order.items
    else
      render plain: 'Please inesert some item in basket'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :rating)
  end
end
