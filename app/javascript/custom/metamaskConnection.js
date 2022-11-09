import Web3 from "web3";

let web3;
let accounts;

const checkProvider = async () => {
  if (localStorage.getItem("signature") == "true") {
    if (typeof window.ethereum !== "undefined") {
      web3 = new Web3(await Web3.givenProvider);
      accounts = await ethereum.request({ method: "eth_requestAccounts" });
      login();
      // message = `Your want to Login in this website via account ${accounts[0]}`;
    } else {
      alert("Please intall metamask");
    }
  }
};

const newSigning = async () => {
  if (typeof window.ethereum !== "undefined") {
    web3 = new Web3(await Web3.givenProvider);
    accounts = await ethereum.request({ method: "eth_requestAccounts" });
    message = `Your want to Login in this website via account ${accounts[0]}`;
    if (await web3.eth.personal.sign(message, accounts[0])) {
      localStorage.setItem("signature", "true");
      return true;
    }
  } else {
    alert("Please intall metamask");
  }
};

window.ethereum.on("accountsChanged", () => {
  localStorage.removeItem("signature");
});

$(document).on("turbo:load", async function () {
  checkProvider();
});

// function to change the login and logout
const login = () => {
  if (typeof accounts != "undefined" && accounts.length) {
    $("#loginId").html(accounts[0]);
  }
};

export { web3, accounts, checkProvider, newSigning };
