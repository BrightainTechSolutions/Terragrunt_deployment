generate "backend" {
    path = "s3-backend.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
terraform {
    backend "s3" {
        bucket = "terragruntbk"
        key   =  "${path_relative_to_include()}/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
        dynamodb_table = "Terraform"
        profile = "shilohIT"
    }
}
EOF
}