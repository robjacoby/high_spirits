var fs = require("fs");
var glob = require("glob");
var path = require("path");
var webpack = require("webpack");
var loadConfig = require("./config");

/**
 * General configuration
 */
var config  = loadConfig(path.join(__dirname, "config.yml"));
var BASE      = path.join(__dirname, "..")
var APPS_BASE = path.join(BASE, "/apps")
var APPS      = glob.sync(APPS_BASE + "/*");
var BUILD     = path.join(__dirname, "build");

/**
 * Custom webpack plugins
 */
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const ESLintPlugin = require("eslint-webpack-plugin");

/**
 * configureEntries
 *
 * Iterate through the `APPS`, find any matching `target.js` files, and
 * return those as entry points for the webpack output.
 *
 */

function configureEntries (entryBase) {
  return function (entries, dir) {
    var app = path.basename(dir);
    var targets = glob.sync(dir + "/**/target.js");

    targets.forEach(function(target) {
      var targetName = path.basename(path.dirname(target));
      entries[app + "__" + targetName] = entryBase.slice().concat([target]);
    });

    return entries;
  }
}

/**
 * Create a base webpack config
 *
 * @param  {Object} options
 *   - {Array} entryBase Allow for a custom "base" for each entry
 *   - {Boolean} quiet Quiets the output from webpack
 * @return {Object} Base webpack config
 */
module.exports = function createBaseConfig (options) {
  // Allow a base for each entry to be set
  var entryBase = [];
  if (options.entryBase) {
    entryBase = options.entryBase;
  }
  // Configure the entry builder function
  var createEntries = configureEntries(entryBase);

  // Create the base config object
  var baseConfig = {
    // Set the context as the apps directory
    context: APPS_BASE,

    // Generate the `entry` points from the filesystem
    entry: APPS.reduce(createEntries, {}),

    // Configure output
    output: {
      // Output into our build directory
      path: BUILD,

      // Template based on keys in entry above
      // Generate hashed names for production
      filename: "[name].js",
    },

    // Plugins
    plugins: [
      // Extract all CSS into static files
      // new MiniCssExtractPlugin(),
      new ESLintPlugin({
        context: APPS_BASE,
        files: APPS,
        emitError: false,
        emitWarning: true
      })
    ],

    // Resolve formalist-theme and shared
    resolve: {
      alias: {
        "shared": path.join(__dirname, "shared"),
      }
    },

    // General configuration
    module: {
      rules: [
        {
          test: /\.css$/,
          exclude: /node_modules/,
          use: [
            {
              loader: 'style-loader',
            },
            {
              loader: 'css-loader',
              options: {
                importLoaders: 1,
              }
            },
            {
              loader: 'postcss-loader'
            }
          ]
        },
        {
          test: /\.(jpe?g|png|gif|svg|woff|ttf|otf|eot|ico)/,
          loader: "file-loader",
          options: {
            name: "[path][name].[ext]"
          }
        },
        // {
        //   test: /\.css$/i,
        //   use: [MiniCssExtractPlugin.loader, 'css-loader'],
        // },
      ],
    }
  };

  // Quiet the output
  if (options.quiet) {
    baseConfig.stats = {
      assets:       false,
      assetsSort:   false,
      cached:       false,
      children:     false,
      chunkModules: false,
      chunkOrigins: false,
      chunks:       false,
      chunksSort:   false,
      colors:       true,
      errorDetails: true,
      hash:         false,
      modules:      false,
      modulesSort:  false,
      reasons:      false,
      source:       false,
      timings:      false,
      version:      false
    };
  };

  return baseConfig;
};
