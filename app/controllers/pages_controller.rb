class PagesController < ApplicationController

  def index
    @tokens = Token.all
  end
  
end
