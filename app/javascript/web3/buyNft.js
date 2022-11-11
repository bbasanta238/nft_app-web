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
    .buyToken(parseInt(tokenID))
    .send({ from: accounts[0], value: amount });
  //   const event = await exchangeContract.getPastEvents("Transfer", {});
  //   const event = await collectiblesContract.getPastEvents("Transfer", {});
  //   return event;
  //   console.log(event);
}

export { buyToken };
