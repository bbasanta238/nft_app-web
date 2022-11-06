class SaleController < ApplicationController

    def create
        if((Token.find(params[:token_id]).list_token).nil?)
            ListToken.create(token_id: params[:token_id], list_price: params[:form][:list_price], is_listed: true)
            redirect_to token_path(params[:token_id])
        else
            list = ListToken.find_by(token_id: params[:token_id])
            list.update(list_price: params[:form][:list_price], is_listed: true)
            redirect_to token_path(params[:token_id])
        end
        # @listed = ListToken.create(token_id: params[:token_id], list_price: params[:form][:list_price], is_listed: true)
        # redirect_to root_path
    end

    def new
        @token= Token.find(params[:token_id])
    end

    def destroy
        list = ListToken.find(params[:id])
        list.update(is_listed: false)
        redirect_to token_path
    end
    
end
