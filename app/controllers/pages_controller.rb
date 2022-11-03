class PagesController < ApplicationController

  def home
    @tokens = Token.all
  end

  def mint
  end

  def create
    redirect_to '/ipfs-upload'
  end

  def ipfsUpload
  end

  def latestMint
    @tokens = Token.all
    FetchLatestMintJob.perform_now("#{gon.contractAddress}",@tokens.length)
    redirect_to '/'
  end
end
