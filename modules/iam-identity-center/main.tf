data "aws_caller_identity" "current" {}

data "aws_ssoadmin_instances" "this" {}

resource "aws_identitystore_group" "admin_group" {
  identity_store_id = data.aws_ssoadmin_instances.this.identity_store_ids[0]
  display_name     = "AdminGroup"
  description      = "Administrator group for Amazon Q Business access"
}

resource "aws_identitystore_group" "amazon_q_users" {
  identity_store_id = data.aws_ssoadmin_instances.this.identity_store_ids[0]
  display_name     = "AmazonQUsers"
  description      = "User group for Amazon Q Business access"
}

resource "aws_identitystore_user" "q_user_1" {
  identity_store_id = data.aws_ssoadmin_instances.this.identity_store_ids[0]
  user_name       = "qbusiness.user1"
  given_name      = "Amazon"
  family_name     = "QUser1"
  display_name    = "Amazon Q Business User 1"
  email           = "quser1@example.com"
}

resource "aws_identitystore_user" "q_user_2" {
  identity_store_id = data.aws_ssoadmin_instances.this.identity_store_ids[0]
  user_name       = "qbusiness.user2"
  given_name      = "Amazon"
  family_name     = "QUser2"
  display_name    = "Amazon Q Business User 2"
  email           = "quser2@example.com"
}

resource "aws_identitystore_group_membership" "user1_group" {
  group_id = aws_identitystore_group.amazon_q_users.group_id
  user_id  = aws_identitystore_user.q_user_1.user_id
}

resource "aws_identitystore_group_membership" "user2_group" {
  group_id = aws_identitystore_group.amazon_q_users.group_id
  user_id  = aws_identitystore_user.q_user_2.user_id
}

resource "aws_ssoadmin_permission_set" "amazon_q_access" {
  instance_arn = data.aws_ssoadmin_instances.this.arns[0]
  name         = "AmazonQBusinessAccess"
  description  = "Permission set for Amazon Q Business access"
}

resource "aws_ssoadmin_account_assignment" "amazon_q_users_assignment" {
  instance_arn        = data.aws_ssoadmin_instances.this.arns[0]
  permission_set_arn  = aws_ssoadmin_permission_set.amazon_q_access.arn
  principal_id        = aws_identitystore_group.amazon_q_users.group_id
  principal_type      = "GROUP"
  target_id           = data.aws_caller_identity.current.account_id
  target_type         = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_managed_policy_attachment" "amazon_q_access" {
  instance_arn        = data.aws_ssoadmin_instances.this.arns[0]
  permission_set_arn  = aws_ssoadmin_permission_set.amazon_q_access.arn
  managed_policy_arn   = "arn:aws:iam::aws:policy/AmazonQBusinessAccess"
}