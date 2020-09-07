class BlogsController < ApplicationController
 
 before_action :move_to_index, except: :index
 
 def index
  @blogs = Blog.all.order("created_at ASC").page(params[:page]).per(7)
 end
 
 def new
 end

 def create
  Blog.create(text: blog_params[:text], user_id: current_user.id)
 end

 def destroy
  blog = Blog.find(params[:blog_id])
  blog.destroy if blog.user_id == current_user.id
 end

 def edit
  @blog = Blog.find(params[:blog_id])
 end

 def update
  blog = Blog.find(params[:blog_id])
  if blog.user_id == current_user.id
    blog.update(text: blog_params[:text], user_id: current_user.id)
  end
 end
 
 def show
  @blog = Blog.find(params[:blog_id])
 end
 
 private
 def blog_params
  params.permit(:text)
 end
 
 def move_to_index
     redirect_to action: :index  unless user_signed_in?
 end
 
end
