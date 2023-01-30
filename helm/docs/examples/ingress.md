# Ingress Deployment Examples


## Deploy Ingress Without TLS

```yaml
---
# values.ingress.yaml
serviceType: ClusterIP  # change blockfrost service to use clusterIP since were setting up an ingress
ingress:
  enabled: true
  host: "blockfrost.example.com"  # assuming this resolves to your cluster or a lb in front of it
  tls:
    enabled: false
...
```

## Deploy Ingress using Nginx Ingress with an AWS Loadbalancer, and cert-manager for TLS
```yaml
---
serviceType: ClusterIP
ingress:
  enabled: true
  host: "blockfrost.example.com"
  tls:
    enabled: true
    secretName: blockfrost-tls
    annotations:
      cert-manager.io/cluster-issuer: "my-cert-manager-issuer"
      acme.cert-manager.io/http01-edit-in-place: "true"
      kubernetes.io/ingress.class: "my-nginx-ingress-name"
```
