# tfstate-manager

Terraform module to manage tfstate in AWS

## How to use

1. In your terraform, use this module to create S3 bucket and DynamoDB table.
    ```
    module "tfstate_manager_module" {
        source = "github.com/MasayaTahara/tfstate-manager"
        env    = "dev"
        app    = "aws-tutorial"
    }
    ```

1. After those resources are created, set up backend.
    ```
    terraform {
        backend "s3" {
            # Variables may not be used here.
            bucket         = "dev-aws-tutorial-tfstate-management-bucket"
            key            = "terraform.tfstate"
            region         = "ap-northeast-1"
            dynamodb_table = "dev-aws-tutorial-tfstate-management-table"
        }
    }
    ```

1. Run "terraform init" again to reflect backend settings.  
    Then, your tfstate is managed in S3 and DynamoDB.