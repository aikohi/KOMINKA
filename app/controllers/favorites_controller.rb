class FavoritesController < ApplicationController
  def index
  	@favorites = Favorite.where(user_id: current_user)
    @user = current_user
  end

  def create
  	user = current_user
  	shop = Shop.find(params[:shop_id])
    Favorite.create(user_id:user.id,shop_id:shop.id)
    redirect_to user_favorites_path(current_user)
  end

  def destroy
  	user = current_user
  	shop = Shop.find(params[:shop_id])
    favorite = Favorite.find_by(user_id: user.id,shop_id:shop.id)
    favorite.destroy
    redirect_to user_favorites_path(current_user)
  end

end
