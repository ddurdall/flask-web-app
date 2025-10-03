# Building and Running the app
## Building the Docker image
To build the docker image, make sure you first have docker installed and configured
and then cd into the project root directory and run:  
`$ docker build -t flask-web-app:latest .`

## Deploying
### Using Kubernetes
1) Start up minikube with `$ minikube start`
2) Point docker to minikube's environment with `$ eval $(minikube docker-env)
3) Ensure docker image is built by following the steps above  
4) Apply each manifest file by running the following in the project root directory  
`$ kubectl apply -f kubernetes`  
Then you can run the app with  
`$ minikube service flask-web-app-service`

### Using the Helm chart
1) First follow the minikube startup steps from above.
2) Then Install the helm chart by running the following in the project root directory  
`$ helm install flask-web-app-helm ./helm`  
Then you can run the app with  
`$ minikube service flask-web-app-helm-service`

# Design decisions
## Docker design
- I separate the build stage and release stage to minimize the image size.
- I chose to use a distroless base image for the release build to further reduce
  the image size and shrink the trusted computing base.
## Kubernetes design
- My network policy restricts ingress traffic to only my applications pods on
  port 5000 which is the port my app runs on.
- My helm templates and charts follow the same structure as my kubernetes configs
  while allowing parameter configuration within values.yaml
