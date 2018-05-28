class UsersController < ApplicationController

  before_action :require_sign_in

  def show
    @item = Item.new
    @items = Item.where(@user == current_user)
  end

end
