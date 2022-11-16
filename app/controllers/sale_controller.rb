class SaleController < ApplicationController
    before_action :is_signed_in?

    def is_signed_in?
        if !user_signed_in?
            redirect_to new_user_registration_path	
        end
    end

    def create
        if((Token.find(params[:token_id]).list_token).nil?)
            ListToken.create(token_id: params[:token_id], list_price: params[:form][:list_price],approval_signature: params[:approvalSignature], is_listed: true)
            redirect_to token_path(params[:token_id])
        else
            list = ListToken.find_by(token_id: params[:token_id])
            list.update(list_price: params[:form][:list_price],approval_signature: params[:approvalSignature], is_listed: true)
            redirect_to token_path(params[:token_id])
        end
    end

    def new
        @token= Token.find(params[:token_id])
    end

    def destroy
        list = ListToken.find(params[:id])
        list.update(is_listed: false,approval_signature: nil)
        redirect_to token_path
    end 
end
