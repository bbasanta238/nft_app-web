class PagesController < ApplicationController

  def index
    @tokens = Token.where.not(owner: params[:account])
  end

end
