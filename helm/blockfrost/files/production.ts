export default {
  server: {
    listenAddress: 'localhost',
    port: 3000,
    debug: false,
  },
  dbSync: {
    host: 'cdbsync-mainnet.mydomain.com',
    user: 'cexplorer',
    database: 'cdbsync',
    maxConnections: 10,
  },
  network: 'mainnet',
  tokenRegistryUrl: 'https://tokens.cardano.org',
};
