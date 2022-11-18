import { buyToken } from "../web3/buyNft";

$(document).on("turbo:load", function () {
  $("#buyBtn").on("click", async () => {
    let tokenID = $("#tokenID").html();
    let price = $("#listedPrice").html();
    let signature = $("#signature").html();
    $("#item").addClass("d-none");
    $("#spinner").removeClass("d-none");

    let message =
      "I owner of this token give approval to sell this token in the above price";
    const event = await buyToken(
      signature,
      message,
      tokenID,
      parseFloat(price)
    );
    if (event) {
      window.location.href = "/buy/new?id=" + tokenID;
    } else {
      window.location.href = `/tokens/${tokenID}`;
      alert("Transaction Error");
    }
  });
});
