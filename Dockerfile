FROM golang:1.20.5 as dev

WORKDIR /work

RUN go install golang.org/x/tools/cmd/godoc@latest

FROM golang:1.20.5 as build

WORKDIR /app
COPY ./app/* /app/
RUN go build -o app

FROM alpine as runtime

COPY --from=build /app/app /
CMD ./app
