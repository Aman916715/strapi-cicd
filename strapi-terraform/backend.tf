terraform {
  backend "s3" {
    bucket         = "terraform-state-aman435"   
    key            = "strapi/terraform.tfstate"  
    region         = "ap-south-1"                
    encrypt        = true
  }
}
