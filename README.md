# Backend Developer Docker Start Kit

This project provides a ready-to-use Docker Compose setup for backend developers. It includes common services like PostgreSQL, Redis, RabbitMQ, MinIO, and Nginx, all pre-configured for local development.

## Services

#### PostgreSQL
#### Redis
#### RabbitMQ
#### MinIO
#### Nginx

## Getting Started

1. Clone the repository:

```bash
git clone git@github.com:alijoghataee/services.git
cd services
```

2. Start services using Docker Compose:

`docker compose up -d`


## Volumes and Persistence

All services are configured with volumes under `./storage/` to keep data persistent between container restarts.

- PostgreSQL: `./storage/postgres`
- Redis: `./storage/redis`
- RabbitMQ: `./storage/rabbitmq`
- MinIO: `./storage/minio`

## Network

All containers are attached to a custom network called `app`.

## Notes

- Make sure ports `5432`, `6379`, `5672`, `15672`, `9000`, `9001`, `80`, and `443` are free on your host machine.
- Nginx configuration is mapped from `./conf/nginx`. Update `nginx.conf` or `default.conf` as needed.
- SSL certificates should be placed in `./certs`.
- This setup can be used for both **dockerized** and **non-dockerized** projects. You can connect your local apps directly to these services without needing Docker for the app itself.

## Contributing

Feel free to add more services or update configurations to match your development workflow.

