
# Capstone977: Architecture & Complete Setup Guide

This document provides a comprehensive, step-by-step explanation of the Capstone977 app and DevOps pipeline, with diagrams for every major component. It is designed for beginners to set up the project from scratch.

---

## 1. Application Overview

**Capstone977** is a full-stack web application for user registration, login, and password reset via email/OTP. It is built with Flask (Python) and MongoDB, and is fully automated using DevOps best practices.

### App Features

- User registration and login
- Email validation and OTP for password reset
- MongoDB backend for user data
- Modular codebase (see `app/` directory)

### App Architecture Diagram

![App Architecture](https://raw.githubusercontent.com/vaibhavkumar779/Capstone977/main/docs/app-architecture.png)

---

## 2. Ansible: Automated Jenkins Setup

Ansible is used to provision and configure the Jenkins CI/CD server automatically.

**Key files:**

- `ansible/jenkinsDeploy.yml` (main playbook)
- `ansible/inventory.ini` (target hosts)
- `ansible/jenkins/` (roles for key, repo, install)

### Ansible Flow Diagram

![Ansible Flow](https://raw.githubusercontent.com/vaibhavkumar779/Capstone977/main/docs/ansible-flow.png)

---

## 3. Docker: Containerizing the App

The Flask app is packaged into a Docker container for portability and consistency.

**Key file:**

- `Dockerfile`

### Docker Build & Run Diagram

![Docker Build & Run](https://raw.githubusercontent.com/vaibhavkumar779/Capstone977/main/docs/docker-build-run.png)

---

## 4. Jenkins: CI/CD Pipeline

Jenkins automates the build, test, and deployment process using the `Jenkinsfile`.

**Pipeline stages:**

1. Install dependencies
2. Lint and test code
3. Build Docker image
4. Push image to DockerHub
5. Deploy to Kubernetes

### Jenkins Pipeline Diagram

![Jenkins Pipeline](https://raw.githubusercontent.com/vaibhavkumar779/Capstone977/main/docs/jenkins-pipeline.png)

---

## 5. Kubernetes: Orchestration

Kubernetes manages the deployment, scaling, and networking of the app and MongoDB.

**Key files:**

- `kubernetes/app/deployment.yml` (Flask app)
- `kubernetes/app/nodeport.yml` (Service)
- `kubernetes/mongodb/mongodb.yml` (MongoDB StatefulSet)

### Kubernetes Deployment Diagram

![Kubernetes Deployment](https://raw.githubusercontent.com/vaibhavkumar779/Capstone977/main/docs/k8s-deployment.png)

---

## 6. End-to-End DevOps Flow

This diagram shows the full automation pipeline from code to production:

![DevOps Flow](https://raw.githubusercontent.com/vaibhavkumar779/Capstone977/main/docs/devops-flow.png)

---

## 7. Step-by-Step Setup Guide (A to Z)

### Prerequisites

- Git, Docker, Python 3.8+, Ansible, kubectl, and access to a Kubernetes cluster

### 1. Clone the Repository

```sh
git clone https://github.com/vaibhavkumar779/Capstone977.git
cd Capstone977
```

### 2. Build and Run Locally (Docker)

```sh
docker build -t flaskappcapstone .
docker run -p 5050:5050 flaskappcapstone
```

### 3. Provision Jenkins with Ansible

```sh
ansible-playbook -i ansible/inventory.ini ansible/jenkinsDeploy.yml
```

### 4. Configure Jenkins

- Set up DockerHub credentials in Jenkins
- Use the provided `Jenkinsfile` for pipeline automation

### 5. Deploy to Kubernetes

```sh
kubectl apply -f kubernetes/mongodb/mongodb.yml
kubectl apply -f kubernetes/app/deployment.yml
kubectl apply -f kubernetes/app/nodeport.yml
```

### 6. Access the App

- Open your browser at `http://<host>:5050`
- Register, login, and use the password reset feature

---

## 8. More Diagrams

All diagrams are available as editable draw.io files in `docs/devops-architecture.drawio`.

---

**This guide and the diagrams are designed to help anyone—from beginner to advanced—set up and understand the full DevOps workflow for Capstone977.**
