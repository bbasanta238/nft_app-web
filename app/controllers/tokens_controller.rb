class TokensController < ApplicationController

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
