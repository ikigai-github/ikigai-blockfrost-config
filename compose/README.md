# Deployment via docker-compose

This deployment leverages docker and docker-compose to quickly standup all of the required infrastructure and services to run the blockfrost backend. <br>


## Usage

To get an instance running now, you can run the following command:
```
docker-compose up
```

This will leverage the `.env` file located in this repo, which contains credentials for the postgres service deployed by docker.


### Customization

You can further customize the deployment by creating your own `.env` file for docker, or using shell environment variables.

<b>DB_NAME</b>            - The database cardano db-sync should connect to in postgres. It will be created during the deployment. <br>
<b>DB_USER</b>            - The username cardano db-sync should use to connect to postgres. The user will be created during the deployment. <br>
<b>DB_PASSWORD</b>        - The password cardano db-sync should use to connect to postgres. THe password will be set during the deployment. <br>


The following variables are specific to the blockfrost/db-sync instances, and more documentation can be found on the blockfrost site.

<b>NETWORK</b>            - The cardano blockfrost network to use. This defaults to preview, but see blockfrosts documentation for all options. <br>
<b>RESTORE_SNAPSHOT</b>   - Restore the db from a snapshot. This isnt currently supported by the docker compose deployment, so use at your own risk. <br>
<b>EXTRA_DB_SYNC_ARGS</b> - Any extra args to pass to the db-sync node <br>


### Accessing Services

All deployed services are exposed on your local host. You can get the ports from the `docker-compose.yml` but the primary blockfrost service is listening on <br>
localhost:3000