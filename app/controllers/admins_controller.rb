class AdminsController < ApplicationController
  layout 'admin'
  def index
    @news = News.all
    @notices = Notice.all
    @distributions = Distribution.all
    @books = Book.all
  end
  
  def show 
  end

end
