class AdminsController < ApplicationController
  layout 'admin'
  def index
    @news = News.all
  end
  
  def show 
  end

end
