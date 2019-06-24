class Admin::ShopsController < ApplicationController
	before_action :admin_user
  def index
  	@shops = Shop.search(params[:search])
  end

  def destroy
    @shop = Shop.find(params[:id])
	  @shop.destroy
	  redirect_to admin_shops_path
  end

  private
    def shop_params
  			params.require(:shop).permit(:search)
  	end
end
