
## Kubernetes Cluster

### Cluster Information
- **Version:** v1.28.15
- **CNI Plugin:** Flannel
- **Nodes:** 2 (1 master + 1 worker)

### Nodes
| Node | Role | Status | IP Address |
|------|------|--------|------------|
| k8s-master | control-plane | Ready | 10.0.1.216 |
| k8s-worker | worker | Ready | 10.0.1.230 |

### Access Cluster
```bash
# SSH to master
ssh -i ~/.ssh/hotel-booking-key ubuntu@3.230.3.156

# Run kubectl commands
kubectl get nodes
kubectl get pods -A

---

## **Step 2: Create Project Structure for Kubernetes Manifests**

```bash
# Create directories
mkdir -p k8s/{base,overlays/{dev,prod}}
mkdir -p app/{backend,frontend}
mkdir -p monitoring
mkdir -p ci-cd

# Create README for k8s directory
cat > k8s/README.md << 'EOF'
# Kubernetes Manifests

This directory contains all Kubernetes manifests for the Hotel Booking application.

## Structure



## Deployment
```bash
# Deploy to dev
kubectl apply -k k8s/overlays/dev

# Deploy to prod
kubectl apply -k k8s/overlays/prod


---

## **Step 3: Create Namespace Manifest**

```bash
cat > k8s/base/namespace.yaml << 'EOF'
apiVersion: v1
kind: Namespace
metadata:
  name: hotel-booking
  labels:
    name: hotel-booking
    environment: dev
