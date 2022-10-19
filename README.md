# hellogo
Tiny Containerized Hello App in Go for Kubernetes testing on Arm or Intel architectures.

## Requirements

Working Kubernetes installation and optionally LoadBalancer

## Usage

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
