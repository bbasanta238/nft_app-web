from web3 import Web3
import sys
import json

def tokens():
    fileName = "app/javascript/abi/NFTContract.json"
    file = open(fileName,"r")
    abiJson= json.load(file)

    # connecting to node provider
    alchemy_url = "https://eth-goerli.g.alchemy.com/v2/wHBfV9tVdzQkuPNalkvRWXvxTPGiMLlD"
    w3 = Web3(Web3.HTTPProvider(alchemy_url))
  
    # recieving contract address
    contractAddress = str(sys.argv[1])
    
    # connecting to contract abi
    NFTContract =  w3.eth.contract(address=contractAddress,abi=abiJson)
    tokensInfo = NFTContract.functions.getAllTokens().call()
    print(json.dumps(tokensInfo))

tokens()


