class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
      before_filter :user_is_current_user, only: [:edit, :update, :destroy]

	def index
		@posts = Post.all.order("created_at DESC")
		@responses = Response.all
	end
	def show
		@post = Post.find(params[:id])
	end
	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private

	def find_post 
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content, :delete_document, :document)
	end
	def user_is_current_user
    unless current_user == @post.user
      redirect_to(root_url, alert: "You cannot mess with this post") and return
    end
end
end
