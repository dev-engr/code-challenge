const { environment } = require("@rails/webpacker");

const webpack = require("webpack");
environment.plugins.append(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    bootstrap: "bootstrap",
    Rails: "@rails/ujs",
    ClipboardJS: ['clipboard']
  })
);

module.exports = environment;
