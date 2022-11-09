class PagesController < ApplicationController

  def index
    if(user_signed_in?)
      # @tokens = Token.where.not(owner: current_user.wallet_address)
        @tokens = Token.joins(:list_token).where(list_token:{is_listed: true}).pluck('tokens.id','tokens.token_id','tokens.name','tokens.image_uri','list_token.list_price')
        # debugger
        # @listed_tokens
        @tokens.each do |token|
          if Token.find_by(token_id: token[1]).owner == current_user.wallet_address
            @tokens.delete(token)
          end
        end
        # @items = @tokens.map{|token| Token.where.not(owner: current_user.wallet_address,token_id: token[1])}

    else
      @tokens = Token.joins(:list_token).where(list_token:{is_listed: true}).pluck('tokens.id','tokens.token_id','tokens.name','tokens.image_uri','list_token.list_price')

    end

  end

end
