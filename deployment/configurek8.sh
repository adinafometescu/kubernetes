kubectl apply -f service.yml
kubectl expose deployment myapp-deployment --type=LoadBalancer --port=9900 --target-port=8080
minikube service myapp-deployment --url