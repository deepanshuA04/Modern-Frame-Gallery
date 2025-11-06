@echo off
echo =====================================
echo 🧪 Running Smoke Test on GREEN...
echo =====================================

kubectl get pods
kubectl get svc

echo ✅ Basic Kubernetes checks complete!
