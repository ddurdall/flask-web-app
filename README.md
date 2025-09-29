# Building and Running the app

## Building the Docker image
To build the docker image, make sure you first have docker installed and configured
and then cd into the project root directory and run:
`$ docker build -t flask-web-app:latest .`


## Deploying
## Using Kubernetes


## Using the Helm chart


# Design decisions
- I separate the build stage and release stage to minimize the image size.
- I chose to use a distroless base image for the release build to further reduce
  the image size and shrink the trusted computing base.
