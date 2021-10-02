# Create s3 bucket to manage tfstate

resource "aws_s3_bucket" "tfstate_manager" {
  bucket = "${var.env}-${var.app}-tfstate-management-bucket"

  acl = "private"

  # Prevent delete by "terraform destroy"
  lifecycle {
    prevent_destroy = true
  }

  # Encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable versioning so we can see the full revision history of our state files
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.tfstate_manager.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
