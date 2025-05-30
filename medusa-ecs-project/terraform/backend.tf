# terraform {
#   backend "s3" {
#     bucket         = "terraform-state-medusa-alvin"
#     key            = "medusa/ecs/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-locks"     # Optional (if created)
#     encrypt        = true
#   }
# }


terraform {
  backend "s3" {
    bucket = "terraform-state-medusa-eu"
    key    = "env:/terraform.tfstate"  # or update this to a better path like "medusa/terraform.tfstate"
    region = "eu-north-1"
  }
}
