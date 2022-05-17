class AuthorsBooksController < ApplicationController
    def index
        @author = Author.find(params[:id])
    end

    def new
        @author = Author.find(params[:id])
    end

    def create
        author = Author.find(params[:id])
        book = author.books.create(book_params)
        redirect_to "/authors/#{author.id}/books"
    end

    private

        def book_params
            params.permit(:title, :page_count, :fiction, :author_id)
        end
end