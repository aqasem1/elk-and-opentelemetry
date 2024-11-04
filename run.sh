kubectl apply -f  crds.yaml
#kubectl wait --for=condition=available --timeout=600s  statefulset/elastic-operator -n elastic-system
kubectl wait --for=condition=READY pod elastic-operator-0 -n elastic-system --timeout=60s
kubectl apply -f elk.yaml









kubectl apply -f cert-manager.yaml

kubectl wait --for=condition=AVAILABLE deployments cert-manager -n cert-manager --timeout=600s
kubectl wait --for=condition=AVAILABLE deployments cert-manager-cainjector -n cert-manager --timeout=600s
kubectl wait --for=condition=AVAILABLE deployments cert-manager-webhook -n cert-manager --timeout=600s




kubectl  apply  -f  opentelemetry-operator.yaml

kubectl wait --for=condition=AVAILABLE deployments opentelemetry-operator-controller-manager -n opentelemetry-operator-system --timeout=600s



sed -i "s/HELLO/$(kubectl get secret/apm-server-quickstart-apm-token -o go-template='{{index .data "secret-token" | base64decode}}')/g"  col.yaml

kubectl  apply  -f  col.yaml
kubectl  apply  -f  inst.yaml

