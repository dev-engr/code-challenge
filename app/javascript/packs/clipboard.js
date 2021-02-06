require("bootstrap");

$(document).on("turbolinks:load", function () {
  // Clipboard
  // eslint-disable-next-line no-undef
  var clipboard = new ClipboardJS("button");
  // eslint-disable-next-line no-unused-vars
  clipboard.on("success", function (e) {
    setTooltip("Copied!");
    hideTooltip();
  });
  // eslint-disable-next-line no-unused-vars
  clipboard.on("error", function (e) {
    setTooltip("Failed!");
    hideTooltip();
  });

  // Tooltip
  $("button").tooltip({
    trigger: "click",
    placement: "bottom",
  });
  function setTooltip(message) {
    $("button").tooltip("hide").attr("data-original-title", message).tooltip("show");
  }
  function hideTooltip() {
    setTimeout(function () {
      $("button").tooltip("hide");
    }, 1000);
  }
});
