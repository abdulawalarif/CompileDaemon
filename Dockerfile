FROM golang:1.24.1-alpine

WORKDIR /app
RUN go install github.com/githubnemo/CompileDaemon@latest

COPY . .


RUN go mod tidy

ENTRYPOINT ["CompileDaemon", "--build=go build -o build/goapp", "--command=./build/goapp", "--build-dir=/app"]