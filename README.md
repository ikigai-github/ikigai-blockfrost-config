# Ikigai Blockfrost

This repo contains different methods for deploying a blockfrost instance. It includes the required infrastructure to support blockfrost such as db-sync and postgresql. <br>
Deployments may support parameters to configure or opt-out of certain features.

## Supported Deployments

For local development, its probably quickest to use the `docker-compose` deployment method. This only requires that you have docker installed locally. <br>
For more flexability or non-local deployments, the `helm` deployment will be a better fit. The helm deployment does support local development environments <br>
out of the box, but also provides options to easily configure and control the deployment.

- [docker-compose](./compose/README.md)
- [helm](./helm/README.md)