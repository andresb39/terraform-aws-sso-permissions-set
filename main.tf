resource "aws_ssoadmin_permission_set" "sso_permission_set" {
  name             = var.group_name
  instance_arn     = tolist(data.aws_ssoadmin_instances.sso.arns)[0]
  description      = var.description
  session_duration = var.session_duration
  tags             = var.tags
}
resource "aws_ssoadmin_managed_policy_attachment" "sso_policy_attachment" {
  count              = length(var.policy_attachment)
  instance_arn       = aws_ssoadmin_permission_set.sso_permission_set.instance_arn
  managed_policy_arn = var.policy_attachment[count.index]
  permission_set_arn = aws_ssoadmin_permission_set.sso_permission_set.arn
}
resource "aws_ssoadmin_permission_set_inline_policy" "sso_inline_policy" {
  count              = length(var.inline_policy) > 0 ? 1 : 0
  inline_policy      = var.inline_policy
  instance_arn       = aws_ssoadmin_permission_set.sso_permission_set.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.sso_permission_set.arn
}

resource "aws_identitystore_group" "identitystore_group" {
  display_name      = var.display_name
  description       = var.description_identity
  identity_store_id = tolist(data.aws_ssoadmin_instances.sso.identity_store_ids)[0]
}

resource "aws_ssoadmin_account_assignment" "account_assignment" {
  for_each           = length(var.target_id) > 0 ? toset(var.target_id) : []
  instance_arn       = aws_ssoadmin_permission_set.sso_permission_set.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.sso_permission_set.arn
  principal_id       = data.aws_identitystore_group.identitystore_group.group_id
  principal_type     = "GROUP"
  target_id          = each.value
  target_type        = "AWS_ACCOUNT"
}
