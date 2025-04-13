module "lambda-dev" {
  source             = "../../iac"
  region             = "us-east-1"
  env                = "prod"
  lambda_name        = "lambda-schedule-turn-off-ec2-hom"
  lambda_handler     = "lambda_function.lambda_handler"
  lambda_runtime     = "python3.12"
  lambda_source_path = "../src"
  lambda_timeout     = "30"
  lambda_memory_size = "128"
  layer_name         = "layer-requests"
  lambda_environment_variables = {
    "ENV" = "prod"
  }
}