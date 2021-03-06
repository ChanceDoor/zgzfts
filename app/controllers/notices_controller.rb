class NoticesController < ApplicationController
  def index
    @notices = Notice.page(params[:page])
  end

  def show
    @notice = Notice.find(params[:id])
  end

  def new
    @notice = Notice.new
    render :layout => "admin"
  end

  def create
    @notice = Notice.new(notice_params)
    @notice.posttime = Time.now
    @notice.admin_id = current_admin.id
    if @notice.save
      redirect_to authenticated_root_path
    else
      render 'new'
    end
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    redirect_to authenticated_root_path
  end

  def edit
    @notice = Notice.find(params[:id])
    render :layout => 'admin'
  end

  def update
    @notice = Notice.find(params[:id])
    if @notice.update_attributes(notice_params)
      redirect_to authenticated_root_path
    else
      render 'edit'
    end
  end

  private
  def notice_params
    params.require(:notice).permit(:body, :posttime, :title)
  end
end
