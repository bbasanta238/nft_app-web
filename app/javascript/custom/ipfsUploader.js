import { Web3Storage } from "web3.storage";
let client;

function getAccessToken() {
  return gon.web3StorageAPIKey;
}

function makeStorageClient() {
  return new Web3Storage({ token: getAccessToken() });
}

// function to upload image in a web3storage
async function uploadImage(file, inputValues) {
  let fileInfo = file.files[0];
  client = makeStorageClient();
  const imageCID = await client.put(file.files);
  let imageURI = `https://${imageCID}.ipfs.dweb.link/${fileInfo.name}`;
  let nftJSON = jsonConvert(imageURI, inputValues);
  uploadMetaData(nftJSON, inputValues);
}

// function to upload json in a web3
async function uploadMetaData(nftJSON, inputValues) {
  const blob = new Blob([nftJSON], { type: "application/json" });
  const files = [new File([blob], `${inputValues.name}.json`)];
  console.log("blob files", files);
  const metaDataCID = await client.put(files);
  let metaDataURI = `https://${metaDataCID}.ipfs.dweb.link/${inputValues.name}.json`;
  console.log("metadata URI", metaDataURI);
}

// function to make a json metaData for nft
function jsonConvert(imageURI, inputValues) {
  jsonObject = {
    "name": `${inputValues.name}`,
    "description": `${inputValues.description}`,
    "image": `${imageURI}`,
  };
  return JSON.stringify(jsonObject);
}

export { uploadImage };
