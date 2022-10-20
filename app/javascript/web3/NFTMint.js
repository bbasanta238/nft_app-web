import { NFTContract, contractConnection } from "../contractConnection";
import { accounts } from "../custom/metamaskConnection";

async function mintNFT(metaDataURI) {
  await contractConnection();
  await NFTContract.methods.safeMint(metaDataURI).send({ from: accounts[0] });
  let event = await NFTContract.getPastEvents("Transfer", {});
  console.log("minted event:", event);
}

export { mintNFT };
