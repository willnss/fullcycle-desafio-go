FROM golang:1.20 as build

WORKDIR /usr/src/app

COPY go.mod ./

COPY . .
RUN GOOS=linux GOARCH=amd64 go build -v -ldflags="-w -s" -o /usr/local/bin/app ./...

FROM scratch

WORKDIR /usr/src/app

COPY --from=build /usr/local/bin/app ./app

CMD ["./app"]
