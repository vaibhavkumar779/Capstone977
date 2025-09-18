# CI/CD Pipeline (Jenkins)

This document details the CI/CD pipeline implemented using Jenkins.

## Jenkinsfile

- Defines stages: Setup, Testing, Build, Push, Deploy.
- Installs dependencies, runs linting and tests, builds Docker image, pushes to DockerHub, and deploys to Kubernetes.

## Steps

1. **Setup**: Install Python dependencies.
2. **Testing**: Run linting and unit tests.
3. **Build**: Build Docker image for the Flask app.
4. **Push**: Push Docker image to DockerHub.
5. **Deploy**: Deploy updated image to Kubernetes cluster.

## Automation

- Triggered on code changes (push/PR).
- Status updates via GitHub integration.
