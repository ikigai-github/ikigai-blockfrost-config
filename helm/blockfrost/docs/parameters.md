# Parameter Inputs

```yaml
---
global:
  commonLabels:
    desc: Any labels you want to add to all created resources
    type: map
  commonAnnotations:
    desc: Any annotations you want to add to all created resources
    type: map
  cardanoNetwork:
    desc: The name of cardano network to connect to. preview, preprod, mainnet etc
    type: str
  postgresql:
    host:
      desc: The hostname of the postgres instance db-sync should connect to
      type: str
    service:
      ports:
        postgresql:
          desc: The port of the postgres instance db sync should connect to
          type: str
    auth:
      secretName:
        desc: The name of the kubernetes secret containing (or to be created with) postgres creds for db sync
        type: str
      existingSecret:
        desc: If a secret with postgres credentials already exists, enter the name here. Should match 'secretName' above
        type: str

# blockfrost service vars
numReplicas:
  desc: The number of replicas for the blockfrost backend deployment
  type: int

tokenRegistryUrl:
  desc: The token registry url blockfrost should use
  type: str

dbSecretName:
  desc: Optional, The name of a secret with PGSQL credentials for blockfrost. Default is to use the global var postgres.auth
  type: str

postgresqlHostname:
  desc: Optional, The name of the remote PGSQL server for blockfrost. Default is to use the global var postgres.hostname
  type: str

imageTag:
  desc: The docker image tag to use for blockfrost-ryo
  type: str

serviceType:
  desc: The type of service to create for the blockfrost api
  type: str

ingress:
  enabled:
    desc: If true, an ingress will be created for the blockfrost api
    type: bool
  host:
    desc: The hostname the blockfrost ingress should listen on
    type: str
  tls:
    enabled:
      desc: If true, the blockfrost ingress will use TLS
      type: bool
    secretName:
      desc: The name of the secret containing the TLS certificate to use
      type: str
  annotations:
    desc: Additional annotations to add to the custom ingress
    type: map

config:
  nodeAppInstance:
    desc: The name of the config blockfrost should use. Config options should generally set via env vars
    type: str
  selfManagedConfigMapName:
    desc: The name of a config map with the custom configs blockfrost should mount and use
    type: str

postgresStorageSize:
  desc: The size of the storage postgres should use for a volume, if postgres is being deployed
  type: str

postgresStorageClassName:
  desc: The name of the storage class postgres should use for a volume, if postgres is being deployed
  type: str

# postgres helm chart vars
postgresql:
  deploy:
    desc: If true, a postgres instance will be deployed to the cluster
    type: bool
  auth:
    deploySecret:
      desc: If true, postgres will generate and deploy its own secret for SA auth. This is dangerous, since its ephemeral
      type: str
    database:
      desc: The name of a database to create in addition to postgres
      type: str
    username:
      desc: The name of a user to create in addition to postgres
      type: str
    secretKeys:
      adminPasswordKey:
        desc: The key the admin password should be stored under, if deploying the auth secret
        type: str
      userPasswordKey:
        desc: The key the user password should be stored under, if deploying the auth secret
        type: str
  primary:
    persistence:
      existingClaim:
        desc: This is not meant to be changed by the end user
        type: str

# cardano_services helm chart vars
cardano_services:
  dbSync:
    restoreSnapshot:
      desc: The local file or url to a state snapshot that db sync should restore from
      type: str
    recreateDb:
      desc: Y or N, if Y the DB will be dropped and recreated
      type: str
    imageTag:
      desc: The tag of the db sync image to use
      type: str
    volumes:
      data:
        storageClassName:
          desc: The name of the storage class to use for the data volume. Defaults to cluster default
          type: str
        storageSize:
          desc: The size of the storage to use for the data volume
          type: str
      tmp:
        enabled: false
          desc: If true, a volume will be mounted over /tmp. Useful when restoring from snapshots
          type: bool
        storageClassName:
          desc: The name of the storage class to use for the tmp volume. Defaults to cluster default
          type: str
        storageSize:
          desc: The size of the storage to use for the tmp volume
          type: str
  node:
    imageTag:
      desc: The tag of the node and submit api image to use
      type: str
    volumes:
      data:
        storageClassName:
          desc: The name of the storage class to use for the data volume. Defaults to cluster default
          type: str
        storageSize:
          desc: The size of the storage to use for the data volume
          type: str
```
