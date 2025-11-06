## Modern Frame Gallery — Blue/Green Deployment Example

This folder contains a complete example demonstrating an automated Blue-Green deployment flow using Jenkins, Kubernetes and Docker.

What you'll find here
- `app/` - a tiny Node.js app that reports which color (BLUE/GREEN) it's running as (used for smoke tests).
- `app/Dockerfile` - builds the sample app.
- `k8s/` - Kubernetes manifests: two Deployments (blue/green) and a Service which routes traffic to the active color.
- `Jenkinsfile` - Declarative Jenkins pipeline that builds, pushes, deploys green, smoke-tests, and switches traffic.
- `scripts/` - helper scripts used by the pipeline to wait for rollouts, run smoke tests, and patch the Service selector.

Quick concept
- We keep two Deployments in the cluster: `modern-frame-gallery-blue` and `modern-frame-gallery-green`.
- The `modern-frame-gallery` Service uses a selector `color: <active>` — switching traffic is a single `kubectl patch` on that Service.
- Jenkins builds a new image, updates the *green* deployment, runs smoke tests against the service (or directly against the green pods), and when successful patches the Service to point to green.

Requirements
- A Kubernetes cluster accessible from Jenkins agent (kubeconfig or in-cluster credentials).
- Docker registry (Docker Hub, ECR, GCR, etc.). Pipeline expects credentials stored in Jenkins credentials.

See the `Jenkinsfile` and `README` sections below for configuration and usage.

---

Local quick test (build and run one of the containers locally):

```bash
# build
docker build -t mfg-demo:blue -f app/Dockerfile app/

# run (blue):
docker run --rm -e APP_COLOR=BLUE -p 8080:8080 mfg-demo:blue

# then open http://localhost:8080 and you should see: "Hello from Modern Frame Gallery - BLUE"
```

Full pipeline and Jenkins configuration details are in the `Jenkinsfile` and inline comments.
