@echo off
echo =====================================
echo 🔄 Switching Traffic from BLUE → GREEN...
echo =====================================

kubectl apply -f k8s\service-blue-to-green.yaml

echo ✅ Traffic switched to GREEN deployment!
