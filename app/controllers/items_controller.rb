class ItemsController < ApplicationController
def index
  @items=Item.all
  respond_to do |format|
  format.csv { send_data @items.to_csv, filename: "items-#{DateTime.now.strftime("%d%m%Y%H%M")}.csv"}
  end
end 
def new
  @item = Item.new
end
    
def create
  @item = Item.new(item_params)
    if @item.save
    ChangeItemMailer.create_noti(@item).deliver_now
      redirect_to action: "index"
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
      redirect_to action: "index"
    else
      render :edit, status: :unprocessable_entity
    end
end
    
def destroy
  @item = Item.find(params[:id])
  @item.destroy
  redirect_to action: "index"
end
def buy
  @item=Item.find(params[:id])
  @order=Order.find(1)
  @order.items<<@item
  redirect_to action: "index"
end
def export_csv
  @items = Item.all
  respond_to do |format|
  format.html
  format.csv { send_data @items.to_csv, filename: "items-#{DateTime.now.strftime("%d%m%Y%H%M")}.csv"}
  end
end
def show_list
  @order=Order.find(1)
  @items=@order.items
end
  private
def item_params
  params.require(:item).permit(:name,:price,:rating)
end
end
