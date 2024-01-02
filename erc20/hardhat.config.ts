require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config()

module.exports = {
  solidity: "0.8.20",
  networks: {
    goerli: {
      url: process.env.SEPOLIA_URL,
      accounts: [process.env.ACCOUNT]
    },
  },
  etherscan: {
    apiKey: process.env.API_KEY,
  },
};