# MedusaJS Backend Deployment on AWS ECS Fargate using Terraform & GitHub Actions

This project demonstrates how to deploy the open-source [MedusaJS](https://medusajs.com/) headless commerce backend to AWS using ECS with Fargate. The infrastructure is provisioned using Terraform, and the CI/CD pipeline is set up using GitHub Actions.

## 🔧 Tech Stack

- MedusaJS (Node.js Headless Commerce)
- AWS ECS Fargate
- AWS ECR
- AWS Application Load Balancer (ALB)
- Terraform (Infrastructure as Code)
- GitHub Actions (CI/CD)
- Docker

---

## 📁 Project Structure

medusa-ecs-project/
│
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ ├── vpc.tf
│ ├── ecs.tf
│ ├── ecr.tf
│ ├── alb.tf
│ └── iam.tf
│
├── docker/
│ ├── Dockerfile
│ └── .dockerignore
│
├── .github/
│ └── workflows/
│ └── ci-cd.yml
│
├── medusa-config/
│ └── (Your MedusaJS backend app)
│
├── README.md
└── video.mp4 (recording of setup and output)

yaml
Copy
Edit

---

## 🧠 Architecture Overview

- ECS Cluster (Fargate) hosts the containerized MedusaJS backend.
- ECR stores the Docker image.
- ALB exposes Medusa's `/` endpoint to the public.
- GitHub Actions builds, pushes the Docker image, and triggers ECS deployment on each commit to the main branch.

---

## ⚙️ Prerequisites

- AWS account
- GitHub account
- AWS CLI configured locally
- Terraform installed (`>=1.3.0`)
- Docker installed
- MedusaJS initialized using `npx create-medusa-app@latest`

---

## 🛠️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/medusa-ecs-project.git
cd medusa-ecs-project
2. Configure Terraform
Update terraform/variables.tf with your:

AWS region

CIDR blocks (optional)

ECS service details

Initialize and apply:

bash
Copy
Edit
cd terraform
terraform init
terraform plan
terraform apply
3. Build and Push Docker Image (Manual First Time)
bash
Copy
Edit
aws ecr get-login-password | docker login --username AWS --password-stdin <ECR_REPO_URL>
docker build -t medusa .
docker tag medusa:latest <ECR_REPO_URL>:latest
docker push <ECR_REPO_URL>:latest
4. Setup GitHub Actions
Go to your GitHub repo > Settings > Secrets and Variables > Actions:

Add the following secrets:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

AWS_REGION

ECR_REPO — name of your repo (e.g., medusa)

ECR_URI — full ECR URI (e.g., 123456789012.dkr.ecr.us-east-1.amazonaws.com/medusa)

GitHub Actions workflow (.github/workflows/ci-cd.yml) will:

Build Docker image

Push to ECR

Update ECS service with new image

5. Access the Application
Once ECS service is deployed:

bash
Copy
Edit
http://<ALB-DNS-NAME>:9000/
🎥 Demo Video
📹 Click here to watch the video explanation

The video includes:

Project walkthrough

Terraform infrastructure deployment

Docker build and push

GitHub Actions demo

ECS deployment

Final output with ALB URL

🧼 Cleanup
bash
Copy
Edit
terraform destroy
📌 Useful Links
MedusaJS Docs

Terraform AWS Provider

GitHub Actions Docs

🙋‍♂️ Author
Your Name
DevOps Engineer
LinkedIn | GitHub