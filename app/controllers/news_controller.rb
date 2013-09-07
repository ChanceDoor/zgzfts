class NewsController < ApplicationController
  def index
    @news = News.all
  end

  def show
    @news = News.find(params[:id])
  end
 
  def new
    @news = News.new
    render :layout => "admin"
  end

  def create
    @news = News.new(params[:news])
    @news.posttime = Time.now
    @news.admin_id = current_admin.id
    if @news.save
      redirect_to admin_root_path
    else
      render 'new'
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    redirect_to admin_root_path
  end

  def edit
    @news = News.find(params[:id])
    render :layout => 'admin'
  end

  def update
    @news = News.find(params[:id])
    if @news.update_attributes(params[:news])
      redirect_to admin_root_path
    else
      render 'edit'
    end
  end
end
