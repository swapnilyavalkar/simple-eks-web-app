#!/bin/bash
# update-app-repo.sh

# Load environment variables
source "/e/workspaces/aws/eks terraform project/.env"

# New GitHub Repository Details
NEW_REPO_URL="https://github.com/swapnilyavalkar/simple-eks-web-app"
NEW_IMAGE_REPO="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/simple-eks-web-app"

# Update .env file
echo "🔄 Updating .env file..."
sed -i "s|^GITHUB_REPO_URL=.*|GITHUB_REPO_URL=${NEW_REPO_URL}|" "/e/workspaces/aws/eks terraform project/.env"

# Update update-configs.sh script
echo "🔄 Updating update-configs.sh script..."
sed -i "s|^GITHUB_REPO_URL=.*|GITHUB_REPO_URL=${NEW_REPO_URL}|" "/e/workspaces/aws/eks terraform project/scripts/update-configs.sh"

# Update ArgoCD configurations
echo "🔄 Updating ArgoCD repo URLs..."
sed -i "s|repoURL: .*|repoURL: ${NEW_REPO_URL}|" "/e/workspaces/aws/eks terraform project/gitops/argocd-app.yaml"
sed -i "s|repoURL: .*|repoURL: ${NEW_REPO_URL}|" "/e/workspaces/aws/eks terraform project/gitops/root-app.yaml"

# Update Helm values for image repository
echo "🔄 Updating Helm values..."
sed -i "s|repository: .*|repository: ${NEW_IMAGE_REPO}|" "/e/workspaces/aws/eks terraform project/helm/monitor-app/values.yaml"

echo "✅ All necessary files updated successfully!"
