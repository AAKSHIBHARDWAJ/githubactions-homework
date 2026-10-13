provider "aws" {
  region = "us-east-1"
}

# checkov:skip=CKV_AWS_18: "Logging not required for homework"
# checkov:skip=CKV_AWS_21: "Versioning not required for homework"
# checkov:skip=CKV_AWS_144: "Replication not required for homework"
# checkov:skip=CKV_AWS_145: "AES256 is sufficient for homework"
# checkov:skip=CKV2_AWS_6: "Public access block not required"
# checkov:skip=CKV2_AWS_61: "Lifecycle configuration not required"
# checkov:skip=CKV2_AWS_62: "Event notifications not required"
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-secure-test-bucket-123456"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
