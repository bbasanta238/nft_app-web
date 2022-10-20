import ABI from "./abi/NFTContract.json";
import { web3 } from "./custom/metamaskConnection";
let lotteryContract;

async function contractConnection() {
  // const deployedAddress = process.env.CONTRACT_ADDRESS
  lotteryContract = new web3.eth.Contract(ABI, gon.contractAddress);
}

export { contractConnection, lotteryContract };
