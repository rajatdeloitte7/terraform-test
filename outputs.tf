output "iam_identity_center" {
  description = "IAM Identity Center details"
  value       = aws_sso_admin_instance.example.id
}

output "s3_bucket_names" {
  description = "List of S3 bucket names"
  value       = aws_s3_bucket.example.*.id
}

output "amazon_q_business" {
  description = "Amazon Q Business information"
  value       = aws_q_business.example.id
}

output "lambda_function_arns" {
  description = "List of Lambda function ARNs"
  value       = aws_lambda_function.example.*.arn
}

output "sqs_queue_urls" {
  description = "List of SQS queue URLs"
  value       = aws_sqs_queue.example.*.id
}

output "infrastructure_summary" {
  description = "Summary of the deployed infrastructure"
  value       = "Total S3 Buckets: ${length(aws_s3_bucket.example)}; Total Lambda Functions: ${length(aws_lambda_function.example)}"
}