# My DevOps CI/CD Demo

A Python application with automated CI/CD pipeline using GitHub Actions, Docker, and AWS.

## Quick Start

```bash
# Run locally
python hello_world.py

# Run with Docker
docker build -t cicd-demo .
docker run cicd-demo
```

## CI/CD Pipeline

**GitHub Actions** pipeline that automatically:
- Tests Python application
- Builds & versions Docker images (semantic versioning)
- Deploys to **AWS ECS Fargate**
- Creates git tags for releases

**Versioning**: Use `[minor]` or `[major]` in commit messages to control version bumps.

**AWS Services**: ECR (registry) + ECS Fargate (compute) + CloudWatch (logs)

## Setup

**Option A - IAM Role (Recommended)**:
1. Create AWS OIDC identity provider
2. Create IAM role for GitHub Actions
3. Add GitHub secret: `AWS_ROLE_ARN`

**Option B - Access Keys**:
1. Add GitHub secrets: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`

**Deploy**: Push to main branch to trigger pipeline

See `GITHUB-IAM-ROLE-SETUP.md` and `CI-CD-DOCUMENTATION.md` for detailed setup. 