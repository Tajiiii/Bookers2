class BooksController < ApplicationController
  def new
    @books = Book.all
  	@book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.new
    @books = Book.all
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
  	@book.save
  	redirect_to book_path(@book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end


  private
  def book_params
  	params.require(:book).permit(:title, :body, :user_id)
  end

end
