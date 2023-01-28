# Parameter Inputs

<table>
<tr>
<th>Parameter</th>
<th>Description</th>
<th>Default</th>
</tr>

<tr>
<td>serviceType</td>
<td>The blockfrost service type</td>
<td>NodePort</td>
</tr>

<tr>
<td>ingress.enabled</td>
<td>If true, an ingress resource will be created for the blockfrost service</td>
<td>false</td>
</tr>

<tr>
<td>ingress.host</td>
<td>The hostname the blockfrost ingress should listen on</td>
<td>""</td>
</tr>

<tr>
<td>ingress.tls.enabled</td>
<td>If true, the ingress created for blockfrost will attempt to use TLS</td>
<td>false</td>
</tr>

<tr>
<td>ingress.tls.secretName</td>
<td>The name of the TLS secret that either eixists or should be created, if the blockfrost ingress and TLS are enabled</td>
<td>""</td>
</tr>

<tr>
<td>ingress.annotations</td>
<td>A dictionary of annotations to apply to the ingress created for blockfrost</td>
<td>{}</td>
</tr>

<tr>
<td>config.nodeAppInstance</td>
<td>The NODE_ENV/NODE_APP_INSTANCE value for the blockfrost service. This value must correspond to a filename in the blockfrost config map</td>
<td>development</td>
</tr>

<tr>
<td>config.selfManagedConfigMapName</td>
<td>Set this to the name of pre-existing config map with blockfrost config files. If this is unset, suggested configs from the blockfrost team will be deployed</td>
<td>development</td>
</tr>

<tr>
<td>cardano_db_sync.nodeStorageClassName</td>
<td>The name of the storage class that should satisfy the cardano node persistent storage claim. Default is cluster default</td>
<td></td>
</tr>

<tr>
<td>cardano_db_sync.nodeStorageSize</td>
<td>The size of the cardano node persistent storage claim</td>
<td>1Gi</td>
</tr>

<tr>
<td>cardano_db_sync.syncStorageClassName</td>
<td>The name of the storage class that should satisfy the cardano db-sync persistent storage claim. Default is cluster default</td>
<td></td>
</tr>

<tr>
<td>cardano_db_sync.syncStorageSize</td>
<td>The size of the cardano node persistent storage claim</td>
<td>3Gi</td>
</tr>

<tr>
<td>cardano_db_sync.postgresStorageClassName</td>
<td>The name of the storage class that should satisfy the postgres persistent storage claim, if postgres is being deployed. Default is cluster default</td>
<td></td>
</tr>

<tr>
<td>cardano_db_sync.postgresStorageSize</td>
<td>The size of the postgres persistent storage claim, if postgres is being deployed</td>
<td>8Gi</td>
</tr>

<tr>
<td>cardano_db_sync.network</td>
<td>The name of the blockfrost network to follow. Options come from the blockfrost documentation</td>
<td>preview</td>
</tr>

<tr>
<td>cardano_db_sync.postgresql.deploy</td>
<td>If true, postgres will be deployed by a helm subhcart and amaged by this stack</td>
<td>true</td>
</tr>

<tr>
<td>cardano_db_sync.postgresql.host</td>
<td>The hostname for the postgresql instance</td>
<td>"{{ .Release.Name }}-postgresql"</td>
</tr>

<tr>
<td>cardano_db_sync.postgresql.recreateDb</td>
<td>If using a deployed postgres instance, 'Y' will cause the database to be dropped and recreated</td>
<td>'N'</td>
</tr>

<tr>
<td>cardano_db_sync.postgresql.auth.deploySecret</td>
<td>If true, a secret will be created with pgsql connection details. The alternative is using a secret that is created outside of this helm chart.</td>
<td>true</td>
</tr>

<tr>
<td>cardano_db_sync.postgresql.auth.database</td>
<td>The name of the database db-sync should connect to in pgsql. If using a deployed pg instance, this database will be created</td>
<td>"cexplorer"</td>
</tr>

<tr>
<td>cardano_db_sync.postgresql.auth.username</td>
<td>The username the db-sync instance should use to connect to pgsql. If using a deployed pg instance, this user will be created with db owner</td>
<td>"cexplorer"</td>
</tr>

<tr>
<td>cardano_db_sync.postgresql.auth.existingSecret</td>
<td>The name of the auth secret, either pre-existing or to be created</td>
<td>"db-user-pass"</td>
</tr>

</table>