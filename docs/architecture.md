# Architecture

```text
                         Developer
                             │
                        git push
                             │
                             ▼
                    GitHub Actions (CI/CD)
                             │
                Build Docker Image
                             │
                             ▼
                       Docker Hub
                             │
                             ▼
                  SSH into AWS EC2
                             │
                             ▼
                     Docker Compose
                             │
         ┌───────────────────┼───────────────────┐
         │                   │                   │
         ▼                   ▼                   ▼
      Nginx              Todo API            MongoDB
    (Port 80)          (Port 3000)        Persistent Volume
         │
         ▼
     Internet Users
```
