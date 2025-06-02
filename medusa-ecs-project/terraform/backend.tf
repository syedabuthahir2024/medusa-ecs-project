terraform {
  backend "s3" {
    bucket         = "terraform-state-medusa-ap"   # New bucket in ap-south-1
    key            = "env:/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"             # If you created it
    encrypt        = true
  }
}
