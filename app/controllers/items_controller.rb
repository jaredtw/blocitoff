class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash.now[:alert] = "Your to-do item has been added to your list."
    else
      flash.now[:alert] = "There was a problem saving your to-do item. Please try again."
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "\"#{{@item.name}}\" was deleted."
    else
      flash.now[:alert] = "Something went wrong, please try again."
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
