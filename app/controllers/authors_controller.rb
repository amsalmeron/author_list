class AuthorsController < ApplicationController

    def index
        @authors = Author.order_created
    end

    def show
        @author = Author.find(params[:id])
    end
    
end