import { NFTContract, contractConnection } from "../contractConnection";
import { accounts } from "../custom/metamaskConnection";

async function mintNFT(metaDataURI) {
  await contractConnection();
  await NFTContract.methods.safeMint(metaDataURI).send({ from: accounts[0] });
  const event = await NFTContract.getPastEvents("Transfer", {});
  return event;
}

export { mintNFT };
