var path = require("path");
var elmSource = __dirname + "/elm";

module.exports = {
  entry: [
    __dirname + "/js/app.js",
    __dirname + "/elm/Main.elm"
  ],
  output: {
    path: __dirname + "/public/js",
    filename: "app.js"
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loaders: "babel-loader",
        query: {
          presets: ["env"]
        }
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: "elm-webpack-loader?cwd=" + elmSource
      }
    ],
    noParse: [/\.elm$/]
  },
  resolve: {
    modules: [
      "node_modules",
      __dirname + "/js"
    ],
    extensions: [".js", ".elm"]
  }
}
