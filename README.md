# Dockerized Strapi Blog Starter

A Dockerized Strapi Blog Starter.

## Docker image

Build the Docker image for production.

1. Make sure to change variables in .env file
2. Run the command `docker build -t lgdweb/strapi-blog:latest ./`
3. Push the image to docker registry `docker push lgdweb/strapi-blog:latest`
4. Run the container `docker compose up -d`
