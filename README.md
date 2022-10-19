# hellogo
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/ms-hello-test)](https://artifacthub.io/packages/search?repo=ms-hello-test)

Tiny Containerized Hello App in Go for Kubernetes testing on Arm or Intel architectures.

## Requirements

Working Kubernetes installation and optionally LoadBalancer

## Usage as a Helm Chart

```shell
> helm repo add irakli https://raw.githubusercontent.com/inadarei/hellogo/main/charts/
> helm repo update irakli
> helm install irakli-test irakli/ms-hello-web
```

## Detailed Usage

```shell
# deploy the service
> make kube-deploy
# check deployment
> kubectl get deployments
# expose service to public via load-balancer
> make kube-expose
# check new public service
> kubectl get services
```
