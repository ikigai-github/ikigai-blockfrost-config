# Ikigai Blockfrost

This repo contains different methods for deploying a blockfrost instance. It includes the required infrastructure to support blockfrost such as db-sync and postgresql. <br>
Deployments may support parameters to configure or opt-out of certain features.

## Supported Deployments

For local development, its probably quickest to use the `docker-compose` deployment method. This only requires that you have docker installed locally. <br>
For more flexability or non-local deployments, the `helm` deployment will be a better fit. The helm deployment does support local development environments <br>
out of the box, but also provides options to easily configure and control the deployment.

- [docker-compose](./compose/README.md)
- [helm](./helm/blockfrost/README.md)

## Installing The Pre-Built Helm Chart

You can install our helm chart by following these commands:

```sh
helm repo add myrepo http://ikigai-shared-helm-charts-public.s3-website-us-east-1.amazonaws.com
helm install blockfrost myrepo/blockfrost
```

#### Deprecated Install

Previously, you would install the tgz archive located in this repo. That method is now deprecated.

## Submitting Transactions

By default, the RYO blockfrost instance does not come with the endpoints required for submitting transactions to the blockchain. In order to do this, you must use the Cardano Submit API service. <br>
Both the docker compose and helm deployments will automatically deploy the cardano submit api service for you, but additional work is required for your application to use it. <br>
One solution would be to create a proxy (like NGINX) in front of both the blockfrost and submit api services. The proxy could direct traffic to either blockfrost or the submit api depending on the <br>
request URI, acting like an api gateway.<br>
Another possible solution would be to adjust the application code so it uses the blockfrost service for reading/getting data, and uses the submit api service for writing data to the chain.<br>
The right solution for your application depends on your use case and requirements, but feel free to reach out to our team for suggestions.
