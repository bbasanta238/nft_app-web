import {
  contractConnection,
  collectiblesContract,
} from "../contractConnection";
import { accounts } from "../custom/metamaskConnection";

async function mintNFT(metaDataURI) {
  await contractConnection();
  await collectiblesContract.methods
    .safeMint(metaDataURI)
    .send({ from: accounts[0] });
  const event = await collectiblesContract.getPastEvents("Transfer", {});
  return event;
}

export { mintNFT };
