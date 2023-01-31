# Repo Folders

- `cloud-infra` - the current README is about the `cloud-infra` folder explaining how to create an EKS cluster and deploy Keycloak inside.
- `dummy-app` - a simple Python app that can be used for testing.
- `local-keycloak-mysql` - shows how to deploy Keycloak locally with a MySQL db.
- `local-keycloak-postgres` - shows how to deploy Keycloak locally with a Postgres db.

# Terraform Setup

## Prerequisites

- Terraform
- An S3 bucket for the TF state (currently called `zero-error-bookings`).
- A Route53 public Hosted Zone for a valid domain.
- A valid certificate from ACM.

## Create EKS

```bash
terraform init \
  -backend-config "region=eu-central-1" \
  -backend-config "bucket=zero-error-bookings" \
  -backend-config "key=dev/terraform.state"

terraform validate

terraform plan

terraform apply
```

The following error might appear on the first `terraform apply`. This probably happents because the K8s token passed to the `kubernetes` provider seems to expire by the time the cluster finishes creating or it does not exist at all yet. The best thing to do would be to get the token from the EKS module outputs, but such a variable does not seem to exist in the module. Run `terraform apply` again and the `aws-auth` ConfigMap updates successfuly.

```bash
│ Error: The configmap "aws-auth" does not exist
│
│   with module.eks.module.eks.kubernetes_config_map_v1_data.aws_auth[0],
│   on .terraform/modules/eks.eks/main.tf line 527, in resource "kubernetes_config_map_v1_data" "aws_auth":
│  527: resource "kubernetes_config_map_v1_data" "aws_auth" {
```

## Get Kubeconfig

```bash
aws eks update-kubeconfig --region eu-central-1 --name dev-zero-eks
```

# Install Keycloak

## Prerequisites

- HELM

## Install NGINX Ingress

Note that the NodePort must match the `http_target_group_port` variable in Terraform. The variable is then used in the ALB Target Group.

```bash
helm upgrade \
  --install nginx-ingress cloud-infra/nginx-ingress \
  --set controller.service.type="NodePort" \
  --set controller.service.httpPort.nodePort=30000 \
  --namespace nginx-ingress \
  --create-namespace \
  --wait \
  --atomic
```

- The following parameters are potentially required for Keycloak to work (according to this post: https://dev.to/aws-builders/keycloak-with-nginx-ingress-6fo), but it seems to work fine without them:

```bash
  --set-string controller.config.entries.use-forwarded-headers="true" \
  --set controller.config.entries.forwarded-for-header="X-Forwarded-For" \
```

## Install Keycloak

```bash
helm upgrade \
  --install keycloak cloud-infra/keycloak \
  --namespace keycloak \
  --create-namespace \
  --wait \
  --atomic
```

## Uninstall Charts

```bash
helm -n keycloak uninstall cloud-infra/keycloak

helm -n nginx-ingress uninstall cloud-infra/nginx-ingress
```
