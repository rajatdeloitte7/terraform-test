output "identity_center_arn" {
  value = data.aws_ssoadmin_instances.identity_center.id
}

output "sso_instance_arn" {
  value = data.aws_ssoadmin_instances.identity_center.sso_instance_arn
}

output "identity_store_id" {
  value = data.aws_ssoadmin_instances.identity_center.identity_store_id
}

output "admin_group_id" {
  value = data.aws_ssoadmin_instances.identity_center.admin_group_id
}

output "amazon_q_users_group_id" {
  value = data.aws_ssoadmin_instances.identity_center.amazon_q_users_group_id
}