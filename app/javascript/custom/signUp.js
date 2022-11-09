import { accounts, newSigning } from "./metamaskConnection";

$(document).on("turbo:load", async () => {
  $("#registrationBtn").on("click", async (e) => {
    e.preventDefault();
    if (await newSigning()) {
      $("#new_user").append(
        `<input type="hidden" name="user[wallet_address]" value="${accounts[0]}">`
      );
      $("#new_user").trigger("submit");
    } else {
      window.location.assign("/users/sign_up");
    }
  });

  $("#logoutId").on("click", () => {
    localStorage.removeItem("signature");
  });
});
