class BooksController < ApplicationController
  before_action :new_book,
                only: [ :create ]
  before_action :set_book,
                only: [ :show, :update, :edit, :destroy ]

  def index
    @available_at = Time.now
    @books = Book.all
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book.save
    redirect_to @book
  end

  def edit; end

  def update
    @book.update(book_params)
    redirect_to @book
  end

  def destroy
    @book.destroy
    redirect_to books_url
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :price, :pages)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def new_book
    @book = Book.new(book_params)
  end

end