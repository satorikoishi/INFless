kubectl apply -f ./yaml/namespaces.yml
kubectl -n openfaasdev create secret generic basic-auth \
--from-literal=basic-auth-user=admin \
--from-literal=basic-auth-password=admin
kubectl apply -f ./yaml/inuse
