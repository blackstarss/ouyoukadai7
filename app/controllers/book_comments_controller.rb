class BookCommentsController < ApplicationController
  
    
  def create
    @comment = current_user.comments.create(comment_id: params[:comment_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
  
end
