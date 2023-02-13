# Postgres Deployment Examples

## Deploy Postgres And Deploy Secret

<b>Note</b>: When using this stack to deploy the auth secret, a password will be automatically generated. As long as this secret persists across updates, you will be able to access the database. However, if the secret is destroyed or replaced, you will no longer be able to access the database.

```yaml
---
# values.postgres.yaml
global:
  postgresql:
    host: host: "mypostgres.example.com"
    auth:
      secretName: "my-pgsql-creds"  # could also just use default value, if your secret matches that name

postgresql:
  deploy: true
  auth:
    deploySecret: true
    username: cexplorer  # even though the auth secret already exists, you need to tell postgres what user should be created
    database: cexplorer  # same as the username, you need to tell postgres what database should be created
...
```

## Deploy Postgres With External Secret

```yaml
---
# values.postgres.yaml
global:
  postgresql:
    host: host: "mypostgres.example.com"
    auth:
      secretName: "my-pgsql-creds"  # could also just use default value, if your secret matches that name

postgresql:
  deploy: true
  auth:
    deploySecret: false
    username: cexplorer  # even though the auth secret already exists, you need to tell postgres what user should be created
    database: cexplorer  # same as the username, you need to tell postgres what database should be created
...

---
# kube-manifests/secrets.yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-pgsql-creds
data:
  postgres_db: cexplorer
  postgres_user: cexplorer
  postgres_password: supersecurepass
  postgres_admin_password: postgresuserpass # this field is specifically for the 'postgres' user on the database
```

## External Postgres With External Secret

```yaml
---
# values.postgres.yaml
global:
  postgresql:
    host: host: "mypostgres.example.com"
    auth:
      secretName: "my-pgsql-creds"  # could also just use default value, if your secret matches that name

postgresql:
  deploy: false
  auth:
    deploySecret: false
...

---
# kube-manifests/secrets.yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-pgsql-creds
data:
  # the data field names are important, these are the 3 required fields and their names
  postgres_db: cexplorer
  postgres_user: cexplorer
  postgres_password: supersecurepass
```
