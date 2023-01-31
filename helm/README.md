# Deployment via helm

Helm offers a convinient and customizable way to deploy blockfrost in your kubernetes cluster. THis documentation will cover local development deployments as well as some suggestions for datacenter deployments.

The cardano db-sync service is included in this deployment as a subchart. Postgresql is optionally included as a subchart as well

## Postgresl and Cardano db-sync

More documentation regarding these services can be found at: <br>
[deployment examples](./docs/examples) <br>
[cardano_db_sync subchart](./charts/cardano_db_sync/README.md) <br>


## Usage

The default settings are designed for a local/development deployment of blockfrost. This includes a local postgresql instance and does not include an ingress (the blockfrost service will only be accessible in-cluster). <br>
```
# working dir is helm

helm install --create-namespace --namespace blockfrost .
```

### Customization

Helm uses `values.yaml` files or command line parameters to change and template the kubernetes manifests. <br>
The [parameter documentation](./docs/parameters.md) has all available parameters, descriptions, and default values. <br>
For input examples, see [the example documentation](./docs/examples)


### Accessing Services

If you do not deploy an ingress, `--set ingress.enabled=true` for example, the blockfrost service will only be accessible as NodePort service at `blockfrost:3000`. <br>
If you do deploy an ingress, it will generally be at `<ingress.host>:443`

All other services are only accessible in-cluster
