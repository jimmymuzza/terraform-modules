resource "aws_signer_signing_profile" "signer_signing_profiles" {
  for_each = var.signer_signing_profiles

  platform_id        = each.value.platform_id
  name               = each.value.name
  name_prefix        = each.value.name_prefix
  region             = each.value.region
  signing_parameters = each.value.signing_parameters
  tags               = each.value.tags
  tags_all           = each.value.tags_all

  dynamic "signature_validity_period" {
    for_each = each.value.signature_validity_period != null ? each.value.signature_validity_period : []
    content {
      type  = signature_validity_period.value.type
      value = signature_validity_period.value.value
    }
  }

  dynamic "signing_material" {
    for_each = each.value.signing_material != null ? each.value.signing_material : []
    content {
      certificate_arn = signing_material.value.certificate_arn
    }
  }
}
