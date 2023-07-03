FROM golang:1.20 as build

WORKDIR /usr/src/app

COPY go.mod ./

COPY . .
RUN go build -v -o /usr/local/bin/app ./...

FROM debian:stable

WORKDIR /usr/src/app

COPY --from=build /usr/local/bin/app ./...

CMD ["app"]