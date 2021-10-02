# Create dynamodb to manage tfstate

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "${var.env}-${var.app}-tfstate-management-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  server_side_encryption {
    enabled = true
  }
}
