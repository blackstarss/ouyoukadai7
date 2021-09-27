class FavoritesController < ApplicationController
  
  def create
    @favorite = Favorite.new(user_id: current_user.id,  post_id: @post.id)
    @favorite.save
  end
  
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, item_id:  @item.id)
    @favorite.destroy
  end
  
  
  
end
