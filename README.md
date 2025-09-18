# Capstone977: DevOps Project

![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)

## Visual Diagrams

- [App Architecture Diagram (drawio)](docs/devops-architecture.drawio)
 <br>_Open with [draw.io](https://app.diagrams.net/) or compatible viewer._
- The diagram includes:
  - Application architecture
  - Ansible automation flow
  - Docker/Jenkins CI/CD
  - Kubernetes deployment

## Project Documentation

- [Architecture Overview](docs/architecture.md)
- [CI/CD Pipeline (Jenkins)](docs/ci-cd.md)
- [Ansible Automation](docs/ansible.md)
- [Docker Containerization](docs/docker.md)
- [Kubernetes Orchestration](docs/kubernetes.md)

---

## Quick Setup Guide

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

### 3. Deploy with Kubernetes

```sh
kubectl apply -f kubernetes/mongodb/mongodb.yml
kubectl apply -f kubernetes/app/deployment.yml
kubectl apply -f kubernetes/app/nodeport.yml
```

### 4. Set Up Jenkins CI/CD

1. Use Ansible to provision Jenkins:

  ```sh
  ansible-playbook -i ansible/inventory.ini ansible/jenkinsDeploy.yml
  ```

2. Configure Jenkins with your DockerHub credentials.

3. Use the provided Jenkinsfile for automated build, test, and deployment.

---

## Features

- User registration/login with email validation and OTP
- MongoDB backend (Kubernetes StatefulSet)
- Automated CI/CD with Jenkins
- Infrastructure as Code (Ansible, K8s YAML)
- Fully containerized and orchestrated

---

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

---

## License

MIT License
