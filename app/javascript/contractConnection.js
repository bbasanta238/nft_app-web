import ABI from "./abi/NFTContract.json";
import collectiblesABI from "./abi/collectibles.json";
import exchangeABI from "./abi/exchange.json";
import { web3 } from "./custom/metamaskConnection";
let NFTContract, collectiblesContract, exchangeContract;

async function contractConnection() {
  // NFTContract = new web3.eth.Contract(ABI, gon.contractAddress);
  collectiblesContract = new web3.eth.Contract(
    collectiblesABI,
    gon.collectiblesAddress
  );
  exchangeContract = new web3.eth.Contract(exchangeABI, gon.exchangeAddress);
}

export {
  contractConnection,
  // NFTContract,
  collectiblesContract,
  exchangeContract,
};
