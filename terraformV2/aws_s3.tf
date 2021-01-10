resource "aws_s3_bucket" "devops_demo_bucket" {
  bucket = "devopsbucketnepal"
}

resource "aws_s3_access_point" "devops_demo_bucket_access" {
  bucket = aws_s3_bucket.devops_demo_bucket.id
  name   = "devopsbucketnepal"
}
