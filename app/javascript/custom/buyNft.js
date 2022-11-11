import { accounts, web3 } from "./metamaskConnection";
// import { buyToken } from "../web3/buyNft";
import { buyToken } from "../web3/buyNft";
// import { setApproval } from "../web3/approval";

$(document).on("turbo:load", function () {
  console.log("buy NFT");
  $("#buyBtn").on("click", async () => {
    // e.preventDefault();
    let tokenID = $("#tokenID").html();
    let price = $("#listedPrice").html();
    const event = await buyToken(tokenID, parseFloat(price));
    if (event) {
      window.location.href = "/buy/new?id=" + tokenID;
    } else {
      alert("Transaction Error");
    }
  });
});
