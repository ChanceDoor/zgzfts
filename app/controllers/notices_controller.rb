class NoticesController < ApplicationController
  def index
    @notices = Notice.all
  end

  def show
    @Notice = Notice.find(params[:id])
  end
end
