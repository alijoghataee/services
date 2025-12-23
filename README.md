# Backend Start Kit

This project provides a ready-to-use Docker Compose setup for backend developers. It includes common services like **PostgreSQL**, **Redis**, **RabbitMQ**, **MinIO**, and **Nginx**, all pre-configured for local development.

## Getting Started

1. Clone the repository:

```bash
git clone git@github.com:alijoghataee/services.git
cd services
```
2. Generate ssl certificate (if you want)

```shell
chmod +x cert.sh
./cert.sh
```

3. Start services using Docker Compose:

`docker compose up -d`


## Volumes and Persistence

Most services are configured with volumes under `./storage/` to keep data persistent between container restarts.

- PostgreSQL: `./storage/postgres`
- Redis: `./storage/redis`
- RabbitMQ: `./storage/rabbitmq`
- MinIO: `./storage/minio`
- MongoDB: `./storage/mongo`

This service uses a Docker volume due to the permissions it requires, which are detailed in [docker-compose.yaml](./docker-compose.yaml).
- Prometheus: `prometheus_data`
- Grafana: `grafana_data`
- Kafka: `kafka_data`

## Network

All containers are attached to a custom network called `app`.

## Notes

- Make sure ports `5432`, `6379`, `5672`, `15672`, `9000`, `9001`, `27017`, `9090`, `9092`, `3000`, `80`, and `443` are free on your host machine.
- Nginx configuration is mapped from `./conf/nginx`. Update `nginx.conf` or `default.conf` as needed.
- Prometheus configuration is mapped from `./conf/prometheus`. Update `prometheus.yaml` as needed.
- This setup can be used for both **dockerized** and **non-dockerized** projects. You can connect your local apps directly to these services without needing Docker for the app itself.

### minio tip:
if you want to use docker and nginx for your local project, use http://minio:9000 for write and nginx server_name (e.g. http://s3.localhost) for serve

django example:
```python
STORAGES = {
    "default": {
        "BACKEND": "storages.backends.s3.S3Storage",
        "OPTIONS": dict(
            access_key="minioadmin",
            secret_key="minioadmin",
            bucket_name="your_bucket_name",
            default_acl="public-read",
            file_overwrite=False,
            location="your_location",
            endpoint_url="http://minio:9000",
            querystring_auth=False,
            custom_domain="http://s3.localhost/",
            url_protocol="http:",

        )
    }
}
```

## Contributing

Feel free to add more services or update configurations to match your development workflow.

