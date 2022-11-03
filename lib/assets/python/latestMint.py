from web3 import Web3
import sys
import json


# importing abi json file

def latestTokens():
    fileName = "app/javascript/abi/NFTContract.json"
    file = open(fileName,"r")
    abiJson= json.load(file)

    # connecting to node provider
    alchemy_url = "https://eth-goerli.g.alchemy.com/v2/wHBfV9tVdzQkuPNalkvRWXvxTPGiMLlD"
    w3 = Web3(Web3.HTTPProvider(alchemy_url))
  
    # recieving contract address
    contractAddress,totalRow = str(sys.argv[1]),str(sys.argv[2])

    # connecting to contract abi
    NFTContract =  w3.eth.contract(address=contractAddress,abi=abiJson)
    tokensSupply = NFTContract.functions.totalSupply().call()
    latestTokenCount = tokensSupply-int(totalRow)
    tokenList = []
    print(latestTokenCount)
    if latestTokenCount>0 :
        for i in range(int(totalRow)+1,tokensSupply+1) :
            tokenURI = NFTContract.functions.tokenURI(i).call()
            soleTokenTuple = (i,tokenURI)
            tokenList.append(soleTokenTuple)
    print ((json.dumps(tokenList)))

latestTokens()
# FetchLatestMintJob.perform_now("0xFD54be2257D293dfAb54C7d09510fdFf9c09f15D",4)
