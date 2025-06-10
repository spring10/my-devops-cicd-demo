# Setup Checklist

## Before Running the Pipeline

### 1. GitHub Secrets Required
Add these to your repository (Settings → Secrets → Actions):

**For IAM Role (Recommended):**
- `AWS_ROLE_ARN` - Your IAM role ARN
- `AWS_ACCOUNT_ID` - Your AWS account ID

**For Access Keys (Alternative):**
- `AWS_ACCESS_KEY_ID` - Your AWS access key
- `AWS_SECRET_ACCESS_KEY` - Your AWS secret key
- `AWS_ACCOUNT_ID` - Your AWS account ID

### 2. AWS Prerequisites
- **ecsTaskExecutionRole** must exist in your AWS account
- **Default VPC** should exist in your target region (eu-north-1)
- **IAM permissions** for ECR, ECS, CloudWatch, EC2 (for VPC queries)

### 3. What the Pipeline Does Automatically
✅ Creates ECR repository
✅ Creates ECS cluster  
✅ Creates CloudWatch log group
✅ Registers task definition
✅ Creates ECS service (first time) or updates existing service
✅ Uses default VPC and security groups

### 4. Manual Steps (if needed)

**Create ecsTaskExecutionRole** (if it doesn't exist):
```bash
aws iam create-role --role-name ecsTaskExecutionRole --assume-role-policy-document '{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}'

aws iam attach-role-policy --role-name ecsTaskExecutionRole --policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy
```

### 5. First Deployment
1. Push to main branch
2. Pipeline will create all AWS resources automatically
3. Check GitHub Actions logs for any issues

## Current Configuration
- **Region**: eu-north-1
- **Cluster**: my-devops-demo-cluster  
- **Service**: my-devops-demo-service
- **Repository**: my-devops-demo 