class BooksController < ApplicationController

  def new

  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:success] = "Book was successfully destroyed."
    redirect_to books_path
  end



  def create
    
    book = Book.new(book_params)
    if book.save
      flash[:success] = "Book was successfully created."
      redirect_to "/books/#{book.id}"
    else
      flash.now[:danger] = "Failed to save."
      render "/books"
    end
  end
  
  
  
  

  def update
    book = Book.find(params[:id])
    
    
    if book.update(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to "/books/#{book.id}"
    else
      flash.now[:danger] = "Failed to update."
      render "/books"
    end
  end



  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
