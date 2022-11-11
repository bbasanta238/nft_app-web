import {
  collectiblesContract,
  exchangeContract,
  contractConnection,
} from "../contractConnection";
import { accounts, web3 } from "../custom/metamaskConnection";

async function buyToken(tokenID, tokenPrice) {
  await contractConnection();
  // await NFTContract.methods.safeMint(metaDataURI).send({ from: accounts[0] });
  const amount = web3.utils.toBN(tokenPrice * 10 ** 18);
  // alert(amount);
  await exchangeContract.methods
    .buyToken(gon.collectiblesAddress, parseInt(tokenID), accounts[0], amount)
    .send({ from: accounts[0], value: amount });
  const event = await collectiblesContract.getPastEvents("Transfer", {});
  //   const event = await collectiblesContract.getPastEvents("Transfer", {});
  return event;
}

export { buyToken };
