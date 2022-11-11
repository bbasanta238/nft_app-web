class BuyController < ApplicationController

    def new
        token = Token.find_by(token_id: params[:id])
        listing = ListToken.find_by(token_id: params[:id])
        token.update(owner: (current_user.wallet_address).downcase)
        listing.update(is_listed: false)
        redirect_to items_path
    end

end
