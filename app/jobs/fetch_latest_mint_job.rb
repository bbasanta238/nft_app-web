class FetchLatestMintJob < ApplicationJob
  queue_as :default
  require 'json'
  require 'rest-client'

  def perform(contractAddress,totalRow)
    @tokens = `python3 lib/assets/python/latestMint.py "#{contractAddress}" "#{totalRow}"`
    parsedTokens = JSON.parse(@tokens)
    @nfts = Array.new()
    for i in (0...parsedTokens.length)do 
        individualNFTObject = fetchAPI(parsedTokens[i])
        @nfts.push(individualNFTObject)
    end 
    updateModel()
  end

  def fetchAPI(individualNFTArray)
    tokenURI  = individualNFTArray[1]
    singleNFT = Hash[]
    tokenIPFSData = JSON.parse(RestClient::Request.execute(method: :get, url: tokenURI, timeout: 20))
    singleNFT[:tokenID] = individualNFTArray[0]
    singleNFT[:tokenURI] = individualNFTArray[1]
    singleNFT[:owner] = individualNFTArray[2].downcase
    singleNFT[:name] = tokenIPFSData["name"]
    singleNFT[:description] = tokenIPFSData["description"]
    singleNFT[:imageURI] = tokenIPFSData["image"]
    return singleNFT
  end

  def updateModel()
    for i in 0...@nfts.length do
      token = Token.where(token_id: @nfts[i][:tokenID]).where(token_uri: @nfts[i][:tokenURI])
      if(token.empty?)
        Token.create(token_id: @nfts[i][:tokenID], token_uri: @nfts[i][:tokenURI], name: @nfts[i][:name], description: @nfts[i][:description], image_uri: @nfts[i][:imageURI], owner: @nfts[i][:owner])
      end
    end
  end
end
