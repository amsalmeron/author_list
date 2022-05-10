class AuthorsBooksController < ApplicationController
    def index
        @author = Author.find(params[:id])
    end
end