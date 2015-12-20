class BooksController < ApplicationController
  def index
    @available_at = Time.now
    @books = Book.all
  end
  def create
    @book = book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit
    end
  end
end