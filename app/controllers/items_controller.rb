class ItemsController < ApplicationController
	def index
		@item=Item.all
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
		byebug
		@item = Item.find(params[:id])
		@item.destroy
     redirect_to action: "index"
	end
  
	private
		
	def item_params
		params.require(:item).permit(:name,:price,:rating)
	end
end
