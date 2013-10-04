class BooksController < ApplicationController
  def index
    @books = Book.page(params[:page]).per(12)
  end
  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    render :layout => "admin"
  end

  def create
    @book = Book.new(params[:book])
    @book.posttime = Time.now
    @book.admin_id = current_admin.id
    if @book.save
      redirect_to admin_root_path
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
    render :layout => 'admin'
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      redirect_to admin_root_path
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to admin_root_path
  end
end
