class BooksController < ApplicationController
  def index
    @books = Book.page(params[:page]).per(12)
    render :layout => "application"
  end
  def show
    @book = Book.find(params[:id])
    render :layout => "application"
  end

  def new
    @book = Book.new
    render :layout => "admin"
  end

  def create
    @book = Book.new(book_params)
    @book.posttime = Time.now
    @book.admin_id = current_admin.id
    if @book.save
      redirect_to authenticated_root_path
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
    if @book.update_attributes(book_params)
      redirect_to authenticated_root_path
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to authenticated_root_path
  end

  private
  def book_params
    params.require(:book).permit(:body, :cover, :posttime, :title, :price, :url)
  end
end
