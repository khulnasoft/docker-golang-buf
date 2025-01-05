ARG GOLANG_VERSION="1.23.3"
FROM golang:${GOLANG_VERSION}-alpine3.19

ARG BUF_VERSION="1.47.2"

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.32.0 \
  && go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.3.0

RUN apk add curl \
      make

RUN curl -sSL \
      "https://github.com/bufbuild/buf/releases/download/v${BUF_VERSION}/buf-$(uname -s)-$(uname -m)" \
      -o "/usr/local/bin/buf" \
    && chmod +x "/usr/local/bin/buf"
