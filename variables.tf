# Terraform Variables for AWS Configuration

variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "iam_identity_center" {
  description = "Configuration for IAM Identity Center"
  type        = map(string)
}

variable "amazon_q_business" {
  description = "Configuration for Amazon Q Business"
  type        = map(string)
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  default     = "my_lambda_function"
}

variable "sqs_queue_name" {
  description = "The name of the SQS queue"
  type        = string
}