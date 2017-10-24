terraform {
  backend "s3" {
    bucket = "cyrille-tfstate-formation"
    key    = "vpc/terraform.tfstate"
    region = "eu-west-1"
  }
}
