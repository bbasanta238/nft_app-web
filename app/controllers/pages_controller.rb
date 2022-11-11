class PagesController < ApplicationController

  def index
    if(user_signed_in?)
       @tokens= Token.includes(:list_token).where(list_token: {is_listed: true}).where.not(tokens: {owner: current_user.wallet_address})
    else
      @tokens= Token.includes(:list_token).where(list_token: {is_listed: true})
    end
  end

end
