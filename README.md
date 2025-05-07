# Simple Monitor App
A basic Flask web app deployed on EKS to display the hostname of the server it is running on.

## Features
- Displays hostname on the home page
- Auto-scaling using Kubernetes
- CI/CD using GitHub Actions
- Helm chart for Kubernetes deployment

## Installation

```python
pip install -r app/requirements.txt
python app/main.py

## Run Tests
python -m unittest discover -s tests
```

```bash
mkdir -p E:/workspaces/aws/simple-eks-web-app/{app/{config,templates},tests,helm/monitor-app/templates,.github/workflows} && 
touch E:/workspaces/aws/simple-eks-web-app/{app/main.py,app/requirements.txt,app/Dockerfile,app/config/settings.yaml,app/templates/index.html,tests/test_app.py,helm/monitor-app/Chart.yaml,helm/monitor-app/values.yaml,helm/monitor-app/templates/deployment.yaml,helm/monitor-app/templates/service.yaml,helm/monitor-app/templates/ingress.yaml,.github/workflows/ci-cd.yaml,.gitignore,README.md,LICENSE}
```

