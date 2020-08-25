class BooksController < ApplicationController

before_action :authenticate_user!
  def new
    @books = Book.all
  	@book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
    @book.user_id = current_user.id
  end

  def show
    @book_show = Book.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def create
  	@book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
  	if @book.save
  	 redirect_to book_path(@book.id), notice: 'You have creatad book successfully.'
    else
      render :index
    end
  end

  def edit
    @books = Book.all
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'You have updated book successfully.'
    else
      render :edit
    end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body, :user_id)
  end

end
