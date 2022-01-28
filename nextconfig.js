/* eslint no-param-reassign: ["error", { "props": false  }] */
const path = require("path");

module.exports = {
  publicRuntimeConfig: {
    TEST: "Test",
  },
  webpack: (config) => {
    // To make Bazel dev server work
    config.watchOptions = { poll: 300 };
    // Handle issues with multiple react versions
    // https://reactjs.org/warnings/invalid-hook-call-warning.html
    config.resolve.alias = {
      ...config.resolve.alias,
      react: path.resolve(
        path.join(process.env.RUNFILES, "npm", "node_modules", "react")
      ),
      "react-dom": path.resolve(
        path.join(process.env.RUNFILES, "npm", "node_modules", "react-dom")
      ),
    };

    return config;
  },
};
