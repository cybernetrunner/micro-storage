# build the server binary
FROM golang:1.16.3 AS builder
LABEL stage=server-intermediate
WORKDIR /go/src/micro/storage

COPY . .
RUN go build -mod=vendor -o bin/server ./cmd/server

# copy the server binary from builder stage; run the server binary
FROM alpine:latest AS runner
WORKDIR /bin

# Go programs require libc
RUN mkdir -p /lib64 && \
    ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

COPY --from=builder /go/src/micro/storage/bin/server .

COPY --from=builder /go/src/micro/storage/db/migrations /db/migrations/
ENTRYPOINT ["server"]
