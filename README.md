# Multi-Container Todo Application

A production-style Todo REST API demonstrating containerization, infrastructure automation, and CI/CD using Docker, Terraform, Ansible, GitHub Actions, AWS EC2, and Nginx.

---

## Features

- RESTful Todo API
- MongoDB persistence
- Dockerized services
- Multi-container deployment using Docker Compose
- Infrastructure as Code using Terraform
- Server configuration using Ansible
- GitHub Actions CI/CD
- Docker Hub image registry
- Nginx Reverse Proxy
- Automatic deployment to AWS EC2

---

## Tech Stack

### Backend

- Node.js
- Express.js

### Database

- MongoDB

### Containers

- Docker
- Docker Compose

### Infrastructure

- AWS EC2
- Terraform

### Configuration Management

- Ansible

### CI/CD

- GitHub Actions
- Docker Hub

### Reverse Proxy

- Nginx

---

## Project Structure

```text
api/
ansible/
terraform/
nginx/
.github/
docker-compose.yml
README.md
```

---

## System Architecture

See:

```
docs/architecture.md
```

---

## Deployment Pipeline

```
Developer

↓

git push

↓

GitHub Actions

↓

Docker Build

↓

Docker Hub

↓

SSH into EC2

↓

Docker Compose

↓

Application Updated
```

---

## Infrastructure Provisioning

Infrastructure is provisioned using Terraform.

Resources created:

- EC2 Instance
- Security Group
- Ansible Inventory
- Automatic Ansible Execution

Deployment:

```bash
terraform apply
```

---

## Configuration Management

After Terraform provisions the EC2 instance, Ansible automatically:

- Installs Docker
- Installs Docker Compose
- Clones the GitHub repository
- Creates the application `.env`
- Starts Docker Compose

---

## Running Locally

```bash
git clone https://github.com/Pranavb1830/multi-container-todo-app

docker compose up
```

---

## CI/CD

Every push to the `main` branch automatically:

- Builds a Docker image
- Pushes the image to Docker Hub
- Connects to EC2 via SSH
- Pulls the latest image
- Restarts the application

---

## Future Improvements

- HTTPS using Let's Encrypt
- Custom Domain
- Elastic IP
- Load Balancer
- Kubernetes Deployment
- Monitoring using Prometheus & Grafana

---

## Screenshots

### Architecture

docs/architecture.md

### GitHub Actions

screenshots/github-actions.png

### Running Containers

screenshots/docker-ps.png

### Application

screenshots/running-app.png

---

## Author

**Pranav B**
