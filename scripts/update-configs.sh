#!/bin/bash
set -e

# Load .env values
source .env

# Update Helm chart values.yaml
echo "🔧 Updating Helm chart values.yaml..."
yq e -i ".image.repository = \"${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}\"" ./helm/monitor-app/values.yaml

# Update service account IRSA ARN
echo "🔧 Updating serviceaccount.yaml..."
sed -i "s|arn:aws:iam::.*:role/.*|${IRSA_ROLE_ARN}|" ./helm/monitor-app/templates/serviceaccount.yaml

# Update GitOps ArgoCD apps
echo "🔧 Updating ArgoCD repoURL in argocd-app.yaml..."
yq e -i ".spec.source.repoURL = \"${GITHUB_REPO_URL}\"" ./gitops/argocd-app.yaml

echo "🔧 Updating GitOps repoURL in root-app.yaml..."
yq e -i ".spec.source.repoURL = \"${GITHUB_REPO_URL}\"" ./gitops/root-app.yaml

echo "✅ All config files have been updated successfully!"
