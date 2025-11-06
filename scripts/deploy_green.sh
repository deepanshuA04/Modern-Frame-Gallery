#!/bin/bash
echo "Deploying GREEN version..."
kubectl apply -f k8s/deployment-green.yaml
