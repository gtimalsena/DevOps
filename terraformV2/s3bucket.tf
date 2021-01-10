resource "aws_s3_bucket" "devops_bucket" {
    bucket = var.devops_s3_bucket
    acl = "private"
    # region = "var.region"
    tags = {
      Name = "Devops-S3-Bucket"
      Environment = "terraform.workspace"
    }
  
}
