class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @editors = Editor.all
    @post = Post.new
    render :layout => "admin"
  end

  def create
    @post = Post.new(params[:post])
    @post.posttime = Time.now
    if @post.save
      redirect_to admin_root_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_root_path
  end

  def edit
    @editors = Editor.all
    @post = Post.find(params[:id])
    render :layout => 'admin'
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to admin_root_path
    else
      render 'edit'
    end
  end
end
