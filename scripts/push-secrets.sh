#!/bin/bash
# push-secrets.sh

# Load environment variables
source "/e/workspaces/aws/eks terraform project/.env"

# Ensure GitHub CLI is installed
if ! command -v gh &> /dev/null; then
  echo "❗ 'gh' command not found. Please install GitHub CLI and authenticate."
  exit 1
fi

# Push secrets to GitHub
gh secret set GIT_REPO_URL -b"$GIT_REPO_URL"
gh secret set AWS_REGION -b"$AWS_REGION"
gh secret set AWS_ACCESS_KEY_ID -b"$AWS_ACCESS_KEY_ID"
gh secret set AWS_SECRET_ACCESS_KEY -b"$AWS_SECRET_ACCESS_KEY"
gh secret set SLACK_WEBHOOK -b"$SLACK_WEBHOOK"
gh secret set SONAR_TOKEN -b"$SONAR_TOKEN"
gh secret set SONAR_HOST_URL -b"$SONAR_HOST_URL"
gh secret set GIT_TOKEN -b"$GIT_TOKEN"
gh secret set SLACK_TOKEN -b"$SLACK_TOKEN"
gh secret set IRSA_ROLE_ARN -b"$IRSA_ROLE_ARN"
gh secret set DOCKER_USERNAME -b"$DOCKER_USERNAME"
gh secret set DOCKER_PASSWORD -b"$DOCKER_PASSWORD"
gh secret set AWS_ACCOUNT_ID -b"$AWS_ACCOUNT_ID"
gh secret set CLUSTER_NAME -b"$CLUSTER_NAME"
gh secret set ECR_REPO -b"$ECR_REPO"

echo "✅ Secrets pushed to GitHub successfully!"
