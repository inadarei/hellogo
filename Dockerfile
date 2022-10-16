#------------------------------------
# Stage 1: build a binary
#------------------------------------
FROM golang:1.19-alpine as base
LABEL maintainer="Irakli Nadareishvili"

ENV SRC_PATH=/app

COPY . ${SRC_PATH}
WORKDIR ${SRC_PATH}

# Build the binary.
RUN go mod init ika.ge/helloweb && go build -o /go/bin/helloweb

#------------------------------------
# STEP 1: build a tiny release image
#------------------------------------
#FROM scratch
FROM golang:1.19-alpine as release
# Copy our static executable.
COPY --from=base /go/bin/helloweb /go/bin/helloweb

ENV PORT=8181
EXPOSE ${PORT}

# Run the hello binary.
ENTRYPOINT ["/go/bin/helloweb"]
# ENTRYPOINT ["/bin/sh"]


