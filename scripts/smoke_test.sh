#!/bin/bash
echo "Running smoke test on GREEN deployment..."
URL=$(minikube service modern-gallery-service --url | head -n 1)
if curl -s --max-time 10 "$URL" | grep -q "Modern"; then
  echo "✅ Smoke test passed!"
  exit 0
else
  echo "❌ Smoke test failed!"
  exit 1
fi
