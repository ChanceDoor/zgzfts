class DistributionsController < ApplicationController
  def index
    @distributions = Distribution.page(params[:page])
  end

  def show
    @distribution = Distribution.find(params[:id])
  end

  def new
    @distribution = Distribution.new
    render :layout => "admin"
  end

  def create
    @distribution = Distribution.new(distribution_params)
    @distribution.posttime = Time.now
    @distribution.admin_id = current_admin.id
    if @distribution.save
      redirect_to authenticated_root_path
    else
      render 'new'
    end
  end

  def destroy
    @distribution = Distribution.find(params[:id])
    @distribution.destroy
    redirect_to authenticated_root_path
  end

  def edit
    @distribution = Distribution.find(params[:id])
    render :layout => 'admin'
  end

  def update
    @distribution = Distribution.find(params[:id])
    if @distribution.update_attributes(distribution_params)
      redirect_to authenticated_root_path
    else
      render 'edit'
    end
  end

  private
  def distribution_params
    params.require(:distribution).permit(:body, :posttime, :title)
  end
end
