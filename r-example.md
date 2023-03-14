## Dockerfile

```
# Use a base image with R and Debian
FROM rocker/r-ver:latest

# Update and install system dependencies
RUN apt-get update && apt-get install -y \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libv8-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install R packages tidyverse, purrr, and janitor
RUN Rscript -e "install.packages(c('tidyverse', 'purrr', 'janitor'),Ncpus=4, repos='http://cran.us.r-project.org')"
```

## Building image

```{}
#docker buildx build -t <username>/<imagename>:<version> --platform linux/x86_64 .
docker buildx build -t ggrimes/renv:1.0.0  --platform linux/x86_64 .
```
## Push to Dockerhub

Docker Hub is a cloud-based registry service that allows users to store, manage, and distribute Docker images.

Pushing a Docker image to a registry, such as Docker Hub, makes the image available for others to download and run in their own Docker environments. It also allows you to share your Docker images with others, collaborate on projects, and deploy your applications to production environments.

```{}
# requires dockerhub account
docker login --username=ggrimes

#pushing image to dockerhub
docker push ggrimes/renv:1.0.0 
```

The image is now uploaded to https://hub.docker.com/repository/docker/ggrimes/renv

# Using Image with singularity on eddie

```
module load singularity
singularity pull --name renv.sif pull docker://ggrimes/renv:1.0.0
```


# Useful Links
https://github.com/rocker-org/rocker-versioned2
