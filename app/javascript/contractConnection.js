import collectiblesABI from "./abi/collectibles.json";
import exchangeABI from "./abi/exchange.json";
import { web3 } from "./custom/metamaskConnection";
let collectiblesContract, exchangeContract;

async function contractConnection() {
  collectiblesContract = new web3.eth.Contract(
    collectiblesABI,
    gon.collectiblesAddress
  );
  exchangeContract = new web3.eth.Contract(exchangeABI, gon.exchangeAddress);
}

export { contractConnection, collectiblesContract, exchangeContract };
