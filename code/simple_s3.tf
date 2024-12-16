provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"

  tags = {
    Environment      = "Dev"
  }
}


resource "aws_s3_bucket" "dev_s3_log_bucket" {
  bucket = "dev_s3-log-bucket"
}

resource "aws_s3_bucket_logging" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id

  target_bucket = aws_s3_bucket.dev_s3_log_bucket.id
  target_prefix = "log/"
}

