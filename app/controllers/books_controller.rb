class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all.order(id: "ASC")
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if  @book.save
    redirect_to book_path(@book)
    else
    render ("index")
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to books_path
    else
     render ("edit")
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    redirect_to books_path
    end
  end

  private
  def book_params
      params.require(:book).permit(:title, :body, :user_id)
  end
end
