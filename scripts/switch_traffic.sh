#!/bin/bash
echo "Switching traffic from BLUE → GREEN..."
kubectl patch service modern-gallery-service -p '{"spec":{"selector":{"app":"modern-gallery-green"}}}'
