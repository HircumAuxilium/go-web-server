# go-web-server-multistage

## Go Web App with Docker Multi-Stage Build

This repository contains a simple Go web application that starts a web server, accepts input, and prints a message to the console. It also includes a Dockerfile configured for multi-stage builds to build and deploy the application.

### Go Application

The Go application (main.go) is a basic web server that listens on port 8080 and responds to requests on the root path ("/") by printing a personalized message to the client.

#### Usage

To run the Go application without Docker, follow these steps:

1. Ensure you have Go installed on your machine.
2. Clone this repository to your local machine.
3. Navigate to the repository directory in your terminal.
4. Run the following command to build and start the application:
   `go run main.go`

Once the application is running, open a web browser and visit http://localhost:8080/yourname to see the personalized message.

### Dockerfile

The Dockerfile (Dockerfile) uses multi-stage builds to optimize the size of the final Docker image. It builds the Go application in one stage and then copies the built binary into a minimal Alpine-based image for deployment.

#### Build Stage

In the build stage (base), the Dockerfile sets up the environment, copies the necessary Go files (go.mod and main.go), downloads dependencies using go mod download, and builds the Go binary (go-docker-aws).

#### Deploy Stage

In the deploy stage (deploy), the Dockerfile copies the built binary from the build stage into the final Docker image. It exposes port 8080 and sets the command to run the Go application (/go-docker-aws) when the container starts.

#### Building and Running with Docker

To build and run the Go application using Docker, follow these steps:

1. Ensure you have Docker installed on your machine.
2. Clone this repository to your local machine if you haven't already.
3. Navigate to the repository directory in your terminal.
4. Build the Docker image using the following command: `docker build -t go-web-app .`
5. Run a Docker container based on the built image: `docker run -p 8080:8080 go-web-app`

Once the container is running, open a web browser and visit http://localhost:8080/yourname to see the personalized message served by the Go web server running inside the Docker container.
