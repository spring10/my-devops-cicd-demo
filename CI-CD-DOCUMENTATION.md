# CI/CD Pipeline Documentation

## Overview
GitHub Actions pipeline that builds, versions, and deploys `hello_world.py` to AWS ECS Fargate.

## Pipeline Flow
1. **Test** → Validates Python application
2. **Version** → Generates semantic version (Major.Minor.Patch)
3. **Build & Deploy** → Docker build + AWS deployment

## Versioning Strategy

**Semantic Versioning**: `1.0.0`, `1.0.1`, `1.1.0`

- **Patch** (default): Auto-increment on every push
- **Minor**: Include `[minor]` in commit message
- **Major**: Include `[major]` in commit message

```bash
git commit -m "Fix bug"                    # 1.0.0 → 1.0.1
git commit -m "[minor] Add feature"       # 1.0.1 → 1.1.0
git commit -m "[major] Breaking change"   # 1.1.0 → 2.0.0
```

## AWS Architecture

**Deployment Target: Amazon ECS Fargate**

- **ECR**: Docker image registry (`cicd-demo`)
- **ECS**: Serverless containers (Fargate)
- **CloudWatch**: Centralized logging
- **Region**: `eu-north-1`