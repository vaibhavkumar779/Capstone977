# Docker Containerization

This document describes how Docker is used in the project.

## Dockerfile

- Based on CentOS image.
- Installs Python, dependencies, and copies app code.
- Exposes ports 3000 and 5050.
- Runs the Flask app with `python3 app.py`.

## Build & Run

```sh
docker build -t flaskappcapstone .
docker run -p 5050:5050 flaskappcapstone
```
