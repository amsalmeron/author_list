class AuthorsController < ApplicationController

    def index
        @authors = Author.order_created
    end

    def show
        @author = Author.find(params[:id])
    end
    
    def new
    
    end
    
    def create
        #Artist.create(name: params[:name])
        @author = Author.create(author_params)
        redirect_to authors_path
    end

    def edit
        @author = Author.find(params[:id])
    end

    def update
        author = Author.find(params[:id])
        author.update(author_params)
        redirect_to "/authors/#{author.id}"
    end

    def destroy
        Author.destroy(params[:id])
        redirect_to authors_path
    end
    
    
    private

        def author_params
            params.permit(:name, :age, :alive)
        end
end