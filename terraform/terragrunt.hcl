locals {
  # Parse the file path we're in to read the env name: e.g., env 
  # will be "dev" in the dev folder, "stage" in the stage folder, 
  # etc.
  parsed = regex(".*/(?P<env>.*?)", get_terragrunt_dir())
  env    = local.parsed.env
}
# Configure S3 as a backend
remote_state {
  backend = "s3"
  config = {
    bucket         = "aimmo-mlops-terraform-backend"
    region         = "ap-northeast-2"
    key            = "tutorial/${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table = "terraform-backend-lock"
    encrypt        = true
  }
  generate = {
    path      = "8_backend.tf"
    if_exists = "overwrite"
  }
}