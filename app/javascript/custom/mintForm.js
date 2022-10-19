import { uploadImage } from "./ipfsUploader";

$(document).on("turbo:load", async () => {
  let file = document.querySelector('input[type="file"]');
  //   const reader = new FileReader();
  $("#formId").on("submit", async () => {
    var values = {};
    $("#formId *")
      .filter(":input")
      .each(function () {
        values[this.id] = $(this).val();
      });

    uploadImage(file, values);
  });
});
