FROM golang:1.20.5 as dev

RUN useradd -m -u 1000 -s /bin/bash dev

WORKDIR /work

RUN go install golang.org/x/tools/cmd/godoc@latest

USER 1000

FROM golang:1.20.5 as build

WORKDIR /app
COPY ./app/* /app/
RUN go build -o app

FROM alpine as runtime

COPY --from=build /app/app /
CMD ./app
