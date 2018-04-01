module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      gas: 33287322,
      network_id: "*" // Match any network id
    },
    rinkeby: {
      host: "localhost",
      port: 8545,
      network_id: "4",
      from: '0xc90743068c0382a500526c8f09adabd8e987e2cb',
      gas: 6000000,
      gasPrice: 21000000000
    },
  }
};
