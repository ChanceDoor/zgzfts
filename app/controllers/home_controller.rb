class HomeController < ApplicationController
  def index
    @news = News.page(params[:news_page]).per(10)
    @notices = Notice.page(params[:notices_page]).per(10)
    @distributions = Distribution.page(params[:dis_page]).per(10)
    @books = Book.all
  end
end
