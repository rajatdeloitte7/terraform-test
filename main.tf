# IAM Identity Center Module
module "iam_identity_center" {
  source = "git::https://github.com/your-org/iam-identity-center-module.git"
}

# S3 Buckets Module
module "s3_buckets" {
  source = "git::https://github.com/your-org/s3-buckets-module.git"

  bucket1_name = "bucket-1"
  bucket2_name = "bucket-2"
}

# IAM Policies and Roles Module
module "iam_policies_roles" {
  source = "git::https://github.com/your-org/iam-policies-roles-module.git"
}

# Amazon Q Business Module
module "amazon_q_business" {
  source = "git::https://github.com/your-org/amazon-q-business-module.git"
}

# SQS Queue Module
module "sqs_queue" {
  source = "git::https://github.com/your-org/sqs-queue-module.git"

  queue_name = "MyQueue"
}

# Lambda Ingestion Module
module "lambda_ingestion" {
  source = "git::https://github.com/your-org/lambda-ingestion-module.git"

  s3_bucket = module.s3_buckets.bucket1_name
}

# Lambda Output Module
module "lambda_output" {
  source = "git::https://github.com/your-org/lambda-output-module.git"

  s3_bucket = module.s3_buckets.bucket2_name
}

# S3 Event Notifications for Source Bucket and Output Bucket
resource "aws_s3_bucket_notification" "bucket1_notification" {
  bucket = module.s3_buckets.bucket1_name

  lambda_function {
    events = ["s3:ObjectCreated:*"]
    lambda_function_arn = module.lambda_ingestion.lambda_function_arn
  }
}

resource "aws_s3_bucket_notification" "bucket2_notification" {
  bucket = module.s3_buckets.bucket2_name

  lambda_function {
    events = ["s3:ObjectCreated:*"]
    lambda_function_arn = module.lambda_output.lambda_function_arn
  }
}