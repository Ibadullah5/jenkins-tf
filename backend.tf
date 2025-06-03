terraform {
  backend "s3" {
    bucket = "tf-backend-test-51351"
    key    = "state-files/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
