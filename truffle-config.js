module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",     // Ganache runs here
      port: 7545,            // Default Ganache port
      network_id: "*",        // Any network
    },
  },
  compilers: {
    solc: {
      version: "0.8.0",      // Match your contract's Solidity version
    }
  }
};