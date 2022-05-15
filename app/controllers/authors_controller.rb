class AuthorsController < ApplicationController

    def index
        @authors = Author.order_created
    end

    def show
        @author = Author.find(params[:id])
    end
    
    def new
        # @author = Author.find(params[:id])
    end
    
    def create
        @author = Author.create(author_params)
        redirect_to authors_path
    end
    
    private

    def author_params
        params.permit(:id, :name, :age, :alive)
    end
end