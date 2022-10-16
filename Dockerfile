#------------------------------------
# Stage 1: build a binary
#------------------------------------
FROM golang:1.19-alpine as base
LABEL maintainer="Irakli Nadareishvili"

ENV SRC_PATH=/app

COPY . ${SRC_PATH}
WORKDIR ${SRC_PATH}

# Build the binary.
RUN go mod init ika.ge/helloweb \
 && CGO_ENABLED=0 go build -ldflags "-s -w -extldflags '-static'" -buildvcs=false -o /go/bin/helloweb

#------------------------------------
# STEP 1: build a tiny release image
#------------------------------------
FROM scratch
# Copy our static executable.
COPY --from=base /go/bin/helloweb /helloweb

ENV PORT=8181
EXPOSE ${PORT}

# Run the hello binary.
ENTRYPOINT ["/helloweb"]


