import {
  collectiblesContract,
  exchangeContract,
  contractConnection,
} from "../contractConnection";
import { accounts } from "../custom/metamaskConnection";

async function setApproval(tokenID) {
  await contractConnection();
  if (
    await collectiblesContract.methods
      .isApprovedForAll(accounts[0], gon.exchangeAddress)
      .call()
  ) {
    return true;
  } else {
    await collectiblesContract.methods
      .setApprovalForAll(gon.exchangeAddress, true)
      .send({ from: accounts[0] });
    let event = await collectiblesContract.getPastEvents("Approval", {});
    return event;
  }
}

export { setApproval };
