@echo off
echo =====================================
echo 🚀 Deploying GREEN environment...
echo =====================================

kubectl apply -f k8s\deployment-green.yaml
kubectl apply -f k8s\service-green.yaml

echo Checking rollout status...
kubectl rollout status deployment/modern-gallery-green

echo ✅ GREEN environment deployed successfully!
