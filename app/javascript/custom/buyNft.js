import { buyToken } from "../web3/buyNft";

$(document).on("turbo:load", function () {
  $("#buyBtn").on("click", async () => {
    let tokenID = $("#tokenID").html();
    let price = $("#listedPrice").html();
    let signature = $("#signature").html();
    $("#item").addClass("d-none");
    $("#spinner").removeClass("d-none");
    const event = await buyToken(tokenID, parseFloat(price));
    if (event) {
      window.location.href = "/buy/new?id=" + tokenID;
    } else {
      window.location.href = `/tokens/${tokenID}`;
      alert("Transaction Error");
    }
  });
});
