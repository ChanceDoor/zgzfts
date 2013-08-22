class HomeController < ApplicationController
  def index
    @news = News.all
    @notices = Notice.all
    @distributions = Distribution.all
  end
end
