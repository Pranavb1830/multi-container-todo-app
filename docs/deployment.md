# Deployment Pipeline

```text
Developer

↓

git push

↓

GitHub Actions

↓

Build Docker Image

↓

Push Image to Docker Hub

↓

SSH into EC2

↓

docker compose pull

↓

docker compose up -d

↓

Application Updated
```
