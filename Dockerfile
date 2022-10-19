#------------------------------------
# Stage 1: build a binary
#------------------------------------
FROM golang:1.19-alpine as base
LABEL maintainer="Irakli Nadareishvili"

ENV SRC_PATH=/app

COPY . ${SRC_PATH}
WORKDIR ${SRC_PATH}

# Build the binary.
RUN ./builder.sh


#------------------------------------
# STEP 1: build a tiny release image
#------------------------------------
FROM scratch
ARG TARGETOS
ARG TARGETARCH
# Copy our static executable.
COPY --from=base /app/${TARGETOS}/${TARGETARCH}/helloweb /helloweb

ENV PORT=8181
EXPOSE ${PORT}

# Run the hello binary.
ENTRYPOINT ["/helloweb"]


