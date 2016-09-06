class ResponsesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@response = @post.responses.create(params[:response].permit(:comment, :user_id, :name))
		@response.user_id = current_user.id if current_user
		@response.save
		if @response.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end
	def edit 
		@post = Post.find(params[:post_id])
		@response = @post.responses.find(params[:id])
	end

	def update
		@post = Post.find(params[:post_id])
		@response = @post.responses.find(params[:id])
		@response.update_attributes(:last_poster_id => current_user.id, :last_post_at => Time.now)
		if @response.update(params[:response].permit(:comment, :user_id, :name))
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@response = @post.responses.find(params[:id])
		@response.destroy
		redirect_to post_path(@post)
	end
end


