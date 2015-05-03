class PurchasesController < ApplicationController

  def create
    item = Item.find(params[:format])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    redirect_to root_path
  end
end
