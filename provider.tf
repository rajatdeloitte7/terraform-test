# Provider configuration

provider "aws" {
  region = var.aws_region
}

# Include module references

module "iam_identity_center" {
  source = "./modules/iam-identity-center"
}

module "s3_buckets" {
  source = "./modules/s3-buckets"
}

module "iam_policies_roles" {
  source = "./modules/iam-policies-roles"
}

module "amazon_q_business" {
  source = "./modules/amazon-q-business"
}

module "lambda_ingestion" {
  source = "./modules/lambda-ingestion"
}

module "lambda_output" {
  source = "./modules/lambda-output"
}

module "sqs_queue" {
  source = "./modules/sqs-queue"
}