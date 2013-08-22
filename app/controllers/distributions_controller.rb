class DistributionsController < ApplicationController
  def index
    @distributions = Distribution.all
  end
  
  def show
    @distribution = Distribution.find(params[:id])
  end
end
