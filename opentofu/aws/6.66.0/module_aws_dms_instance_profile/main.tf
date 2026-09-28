resource "aws_dms_instance_profile" "dms_instance_profiles" {
  for_each = var.dms_instance_profiles

  availability_zone       = each.value.availability_zone
  description             = each.value.description
  kms_key_arn             = each.value.kms_key_arn
  name                    = each.value.name
  network_type            = each.value.network_type
  publicly_accessible     = each.value.publicly_accessible
  region                  = each.value.region
  subnet_group_identifier = each.value.subnet_group_identifier
  tags                    = each.value.tags
  vpc_security_group_ids  = each.value.vpc_security_group_ids
}
