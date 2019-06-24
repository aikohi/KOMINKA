class PostCommentsController < ApplicationController
before_action :authenticate_user!
	def create
		shop = Shop.find(params[:shop_id])
	    comment = current_user.post_comments.new(post_comment_params)
	    comment.shop_id = shop.id
	    if comment.save
	       redirect_to shop_path(shop)
	    else
	       redirect_to shop_path(comment.shop)
	    end

	end

	def destroy
	  	post_comment = PostComment.find(params[:id])
		post_comment.destroy
		redirect_to shop_path(post_comment.shop)
  	end

	private

	def post_comment_params
	  params.require(:post_comment).permit(:user_id,
	                      :shop_id,
	                      :comment)
	end
end