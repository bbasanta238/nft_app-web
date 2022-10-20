import ABI from "./abi/NFTContract.json";
import { web3 } from "./custom/metamaskConnection";
let NFTContract;

async function contractConnection() {
  NFTContract = new web3.eth.Contract(ABI, gon.contractAddress);
}

export { contractConnection, NFTContract };
