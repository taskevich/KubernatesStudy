# Run

```shell
minikube image build -t <name>:<tag> .
```

```shell
kubectl apply -f <deployment_file>.yaml
```

```shell
kubectl port-forward --address 0.0.0.0 service/nginx-service 8000:80
```