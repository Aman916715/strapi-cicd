variable "aws_region" {
  description = "AWS region to deploy"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "public_key_path" {
  description = "path to the public SSh key"
  type        = string
  default     = "/Users/sunnygupta/.ssh/id_ed25519.pub"
}

variable "image_uri" {
  description = "ECR image URI for Strapi"
  type        = string
  default     = "145065858967.dkr.ecr.ap-south-1.amazonaws.com/strapi-aman"
}

variable "image_tag" {
  description = "Tag for the Docker image"
  type        = string
  default     = "latest"  # GitHub Actions will override this dynamically
}
