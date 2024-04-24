FROM golang:1.22-alpine AS base

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY *.go ./

RUN go build -o /go-docker-aws

FROM alpine:latest AS deploy

COPY --from=base /go-docker-aws /go-docker-aws

EXPOSE 8080

CMD [ "/go-docker-aws" ]
