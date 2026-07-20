resource "aws_db_instance_role_association" "db_instance_role_associations" {
  for_each = var.db_instance_role_associations

  db_instance_identifier = each.value.db_instance_identifier
  feature_name           = each.value.feature_name
  role_arn               = each.value.role_arn
  region                 = each.value.region
}
