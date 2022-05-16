class BooksController < ApplicationController 
    def index
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        book = Book.find(params[:id])
        book.update(book_params)
        redirect_to "/books/#{book.id}"
    end
    
    private

    def book_params
        params.permit(:title, :page_count, :fiction)
    end
    
end