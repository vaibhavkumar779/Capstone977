# Kubernetes Orchestration

This document explains the Kubernetes setup for the project.

## App Deployment

- `kubernetes/app/deployment.yml`: Deploys Flask app as a Deployment.
- `kubernetes/app/nodeport.yml`: Exposes app via NodePort service.

## MongoDB Deployment

- `kubernetes/mongodb/mongodb.yml`: StatefulSet for MongoDB with persistent storage and headless service.

## Usage

```sh
kubectl apply -f kubernetes/mongodb/mongodb.yml
kubectl apply -f kubernetes/app/deployment.yml
kubectl apply -f kubernetes/app/nodeport.yml
```
