resource "aws_ecr_repository_creation_template" "ecr_repository_creation_templates" {
  for_each = var.ecr_repository_creation_templates

  applied_for          = each.value.applied_for
  prefix               = each.value.prefix
  custom_role_arn      = each.value.custom_role_arn
  description          = each.value.description
  image_tag_mutability = each.value.image_tag_mutability
  lifecycle_policy     = each.value.lifecycle_policy
  region               = each.value.region
  repository_policy    = each.value.repository_policy
  resource_tags        = each.value.resource_tags

  dynamic "encryption_configuration" {
    for_each = each.value.encryption_configuration != null ? each.value.encryption_configuration : []
    content {
      encryption_type = encryption_configuration.value.encryption_type
      kms_key         = encryption_configuration.value.kms_key
    }
  }

  dynamic "image_tag_mutability_exclusion_filter" {
    for_each = each.value.image_tag_mutability_exclusion_filter != null ? each.value.image_tag_mutability_exclusion_filter : []
    content {
      filter      = image_tag_mutability_exclusion_filter.value.filter
      filter_type = image_tag_mutability_exclusion_filter.value.filter_type
    }
  }
}
