import { accounts, web3 } from "./metamaskConnection";
import { buyToken } from "../web3/buyNft";

$(document).on("turbo:load", function () {
  console.log("buy NFT");
  $("#buyBtn").on("click", async () => {
    let tokenID = $("#tokenID").html();
    let price = $("#listedPrice").html();
    $("#item").addClass("d-none");
    $("#spinner").removeClass("d-none");
    // window.location.href = "/ipfs-upload";
    const event = await buyToken(tokenID, parseFloat(price));
    if (event) {
      window.location.href = "/buy/new?id=" + tokenID;
    } else {
      window.location.href = `/tokens/${tokenID}`;
      alert("Transaction Error");
    }
  });
});
