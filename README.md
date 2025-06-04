# GitHub Actions: CI/CD Workflow for Deploying a Backend API to AWS (Staging & Production)

This project demonstrates a **real-world continuous deployment setup** using GitHub Actions, Terraform, and EC2 for a simple FastAPI backend. It covers two environments: **staging (auto-deployed)** and **production (manual approval)**.

---

## Project Structure

```
.
├── .github/
│   └── workflows/
│       ├── deploy_staging.yml         
│       └── deploy_production.yml       
├── app/
│   ├── __init__.py
│   └── main.py                        
├── terraform/
│   ├── ec2.tf                         
│   ├── ecr.tf                         
│   ├── iam.tf                         
│   ├── outputs.tf
│   ├── provider.tf
│   ├── variables.tf
│   └── .terraform.lock.hcl
├── Dockerfile                       
├── requirements.txt                 
└── README.md
```

---

## What This Project Shows

* GitHub Actions CI/CD pipeline for two environments
* Secure environment variables using GitHub secrets
* Docker image build and push to AWS ECR
* Terraform-managed EC2 and IAM setup
* Dynamic environment injection (staging/production)
* Clean production deployment triggered manually

--- 

## API Output Examples

```json
// Staging
{"env": "staging", "version": "1", "status": "running"}

// Production
{"env": "production", "version": "1", "status": "running"}
```

---

## How to Use

### 1. Set Up AWS & Terraform

* Configure AWS credentials and backend.
* Run `terraform init` & `terraform apply` from the `terraform/` directory.

### 2. Configure GitHub Secrets

In your GitHub repository settings, add these secrets:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `ECR_REPOSITORY`
* `EC2_STAGING_IP`
* `EC2_PROD_IP`

### 3. CI/CD Pipeline

* On push to `main`: auto-deploys to **staging**.
* From GitHub UI: trigger manual **production** deployment when staging looks good.

---


## Note

Not just a random demo — this was built step by step with real hands-on effort, debugging weird issues and setting things up like you would in a real team.
If it helps you or you want to tweak it for your own setup, go ahead. PRs always welcome.

---


