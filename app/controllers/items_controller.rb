class ItemsController < ApplicationController

    def index
        @tokens = Token.all
    end

end
