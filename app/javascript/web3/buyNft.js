import {
  collectiblesContract,
  exchangeContract,
  contractConnection,
} from "../contractConnection";
import { accounts, web3 } from "../custom/metamaskConnection";

async function buyToken(signature, message, tokenID, tokenPrice) {
  await contractConnection();
  const amount = web3.utils.toBN(tokenPrice * 10 ** 18);
  await exchangeContract.methods
    .buyToken(
      gon.collectiblesAddress,
      parseInt(tokenID),
      accounts[0],
      amount,
      message,
      signature
    )
    .send({ from: accounts[0], value: amount });
  const event = await collectiblesContract.getPastEvents("Transfer", {});
  return event;
}

export { buyToken };
