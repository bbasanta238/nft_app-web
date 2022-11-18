import { accounts, web3 } from "./metamaskConnection";
import { setApproval } from "../web3/approval";

$(document).on("turbo:load", function () {
  $("#listingBtn").on("click", async (e) => {
    e.preventDefault();
    let tokenID = $("#tokenID").html();
    let price = $("#form_list_price").val();

    const signature = await approvedSignature(tokenID, price);
    if (signature) {
      $("#sellWizard").addClass("d-none");
      $("#spinner").removeClass("d-none");
      if (await setApproval()) {
        $("#sellForm").append(
          `<input type="hidden" name="approvalSignature" value=${signature}>`
        );
        $("#sellForm").trigger("submit");
      } else {
        alert("Error in approval");
      }
    }
  });

  // signing the approval
  const approvedSignature = async (tokenID, price) => {
    let message =
      "I owner of this token give approval to sell this token in the above price";
    let hashedMessage = await web3.utils.soliditySha3(message);
    let signature = await web3.eth.personal.sign(hashedMessage, accounts[0]);
    return signature;
  };
});
