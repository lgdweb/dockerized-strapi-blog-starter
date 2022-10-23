# Dockerized Strapi Base

Base project used to Dockerize a Strapi application.

## Base Docker image

Build the base Docker image for production.

1. Make sure to change variables in .env file
2. Run the command `docker build -t lgdweb/strapi-base:latest ./`
3. Push the image to docker registry `docker push lgdweb/strapi-base:latest`
4. Run the container `docker compose up -d`
