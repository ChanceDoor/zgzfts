class EditorsController < ApplicationController
  def index
    @editors = Editor.page(params[:page]).per(12)
    render :layout => "application"
  end

  def show
    @editor = Editor.find(params[:id])
    @columns = @editor.posts
    render :layout => "application"
  end

  def new
    @editor = Editor.new
    render :layout => "admin"
  end

  def create
    @editor = Editor.new(editor_params)
    if @editor.save
      redirect_to authenticated_root_path
    else
      render 'new'
    end
  end

  def destroy
    @editor = Editor.find(params[:id])
    @editor.destroy
    redirect_to authenticated_root_path
  end

  def edit
    @editor = Editor.find(params[:id])
    render :layout => 'admin'
  end

  def update
    @editor = Editor.find(params[:id])
    if @editor.update_attributes(editor_params)
      redirect_to authenticated_root_path
    else
      render 'edit'
    end
  end

  private
  def editor_params
    params.require(:editor).permit(:name, :portrait, :resume, :level)
  end
end
