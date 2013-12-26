class HomeController < ApplicationController
  def index
    @news = News.page(params[:news_page]).per(10)
    @notices = Notice.page(params[:notices_page]).per(5)
    @distributions = Distribution.page(params[:dis_page]).per(10)
    @books = Book.all
    @posts = Post.page(params[:posts_page]).per(3)
    @editor = @posts.first.nil? ? nil : Editor.find(@posts.first.editor_id)
  end
end
