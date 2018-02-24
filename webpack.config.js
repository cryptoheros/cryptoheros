var webpack = require("webpack");
var CopyWebpackPlugin = require('copy-webpack-plugin');
var ExtractTextPlugin = require("extract-text-webpack-plugin");

const path = require('path');

module.exports = {
  entry: './src/js/app.js',
  output: {
    path: path.resolve(__dirname, "./build"),
    filename: 'app.js'
  },
  module: {
    loaders: [
      { test: /\.(js|jsx|es6)$/, exclude: /node_modules/, loader: "babel-loader"},
      { test: /\.scss$/i, loader: ExtractTextPlugin.extract(["css", "sass"])},
      { test: /\.json$/i, loader: "json-loader"},
      { test: /\.sol/, loader: 'truffle-solidity' }
    ]
  },
  plugins: [
    new CopyWebpackPlugin([
      { from: './src/index.html', to: "index.html" },
      { from: './src/images', to: "images" },
      { from: './src/fonts', to: "fonts" },
      { from: './src/js', to: "js" },
      { from: './src/css', to: "css" },
      { from: './src/heros.json', to: "heros.json" },
      { from: './contracts/Adoption.json', to: "Adoption.json" }
    ]),
    new ExtractTextPlugin("app.css")
  ],
  devServer: {
    stats: 'errors-only',
  }
};
