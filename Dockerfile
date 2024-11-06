FROM golang:1.23
COPY . /go/src/github.com/elwinar/rambler
WORKDIR /go/src/github.com/elwinar/rambler
RUN go get ./...
RUN go build -buildvcs=false -ldflags="-s -linkmode external -extldflags -static -w"

FROM scratch
MAINTAINER Zhao Wang <zhaow.km@gmail.com>
COPY --from=0 /go/src/github.com/elwinar/rambler/rambler /
CMD ["/rambler", "apply", "-a"]
