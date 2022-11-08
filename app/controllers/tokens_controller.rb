class TokensController < ApplicationController
    before_action :is_signed_in?

    def is_signed_in?
        if !user_signed_in?
            redirect_to new_user_registration_path	
        end
    end

    def create
        redirect_to ipfs_upload_path
    end

    def new 
    end

    def show
        @token = Token.find(params[:id])
        @listed = Token.find(params[:id]).list_token
        if(@listed.nil? || !@listed.is_listed)
            @sell = false
        elsif
            @sell = true
        end
    end

    def ipfsUpload
    end

    def latestMint
        @tokens = Token.all
        FetchLatestMintJob.perform_now("#{gon.contractAddress}",@tokens.length)
        redirect_to root_path
    end
    
end
