class ItemsController < ApplicationController
    before_action :is_signed_in?

    def is_signed_in?
        if !user_signed_in?
            redirect_to new_user_registration_path	
        end
    end

    def index
        @tokens= Token.includes(:list_token).where(tokens: {owner: current_user.wallet_address})
    end

end
