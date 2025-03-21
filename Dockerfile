FROM golang:1.24.1-alpine
RUN go install github.com/githubnemo/CompileDaemon@latest

WORKDIR /app

COPY ./ ./


ENTRYPOINT CompileDaemon --build="go build -o build/goapp" -command="./build/goapp" -build-dir=/app