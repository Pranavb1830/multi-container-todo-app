# Multi-Container Todo Application

A production-style multi-container Todo REST API built with **Node.js**, **Express**, **MongoDB**, and **Docker Compose**. This project demonstrates containerization, persistent storage, and forms the foundation for Infrastructure as Code (Terraform), Configuration Management (Ansible), and CI/CD using GitHub Actions.

---

## Features

- Create Todo
- Get All Todos
- Get Todo by ID
- Update Todo
- Delete Todo
- MongoDB data persistence
- Dockerized Node.js API
- Multi-container setup using Docker Compose

---

## Tech Stack

- Node.js
- Express.js
- MongoDB
- Mongoose
- Docker
- Docker Compose

### Upcoming

- Terraform (AWS Infrastructure)
- Ansible (Server Provisioning)
- GitHub Actions (CI/CD)
- Nginx Reverse Proxy

---

## Project Structure

```
multi-container-todo-app/
│
├── api/
│   ├── config/
│   ├── controllers/
│   ├── models/
│   ├── routes/
│   ├── Dockerfile
│   ├── server.js
│   ├── package.json
│   └── .env.example
│
├── terraform/
│   └── main.tf
│
├── docker-compose.yml
├── README.md
└── .gitignore
```

---

## API Endpoints

| Method | Endpoint | Description |
|---------|----------|-------------|
| GET | `/todos` | Get all todos |
| POST | `/todos` | Create a new todo |
| GET | `/todos/:id` | Get a todo by ID |
| PUT | `/todos/:id` | Update a todo |
| DELETE | `/todos/:id` | Delete a todo |

---

## Environment Variables

Create a `.env` file inside the `api` directory.

```
PORT=3000
MONGO_URI=mongodb://localhost:27017/todos
```

> When using Docker Compose, the MongoDB connection string is automatically overridden to connect to the MongoDB container.

---

## Running Locally

### Install dependencies

```bash
cd api
npm install
```

### Start the API

```bash
npm run dev
```

---

## Running with Docker

From the project root:

```bash
docker compose up --build
```

The API will be available at:

```
http://localhost:3000
```

---

## Stopping Containers

```bash
docker compose down
```

---

## Data Persistence

MongoDB data is stored using a Docker named volume.

Stopping and restarting containers does not delete Todo data.

---

## Future Improvements

- Deploy on AWS EC2
- Infrastructure with Terraform
- Automated server configuration using Ansible
- CI/CD using GitHub Actions
- Nginx Reverse Proxy
- Custom Domain with HTTPS

---

## Author

**Pranav B**

Computer Engineering Student

Mumbai, India