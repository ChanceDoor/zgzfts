class EditorsController < ApplicationController
  def index
    @editors = Editor.page(params[:page]).per(12)
    render :layout => "application"
  end

  def show
    @editor = Editor.find(params[:id])
    render :layout => "application"
  end

  def new
    @editor = Editor.new
    render :layout => "admin"
  end

  def create
    @editor = Editor.new(params[:editor])
    if @editor.save
      redirect_to admin_root_path
    else
      render 'new'
    end
  end

  def destroy
    @editor = Editor.find(params[:id])
    @editor.destroy
    redirect_to admin_root_path
  end

  def edit
    @editor = Editor.find(params[:id])
    render :layout => 'admin'
  end

  def update
    @editor = Editor.find(params[:id])
    if @editor.update_attributes(params[:editor])
      redirect_to admin_root_path
    else
      render 'edit'
    end
  end
end
