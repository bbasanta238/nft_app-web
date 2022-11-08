class PagesController < ApplicationController

  def index
    if(user_signed_in?)
      @tokens = Token.where.not(owner: current_user.wallet_address)
    else
      @tokens = Token.all
    end

  end

end
