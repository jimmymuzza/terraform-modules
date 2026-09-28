resource "aws_ecr_repository" "ecr_repositories" {
  for_each = var.ecr_repositories

  name                 = each.value.name
  force_delete         = each.value.force_delete
  image_tag_mutability = each.value.image_tag_mutability
  region               = each.value.region
  tags                 = each.value.tags
  tags_all             = each.value.tags_all

  dynamic "encryption_configuration" {
    for_each = each.value.encryption_configuration != null ? each.value.encryption_configuration : []
    content {
      encryption_type = encryption_configuration.value.encryption_type
      kms_key         = encryption_configuration.value.kms_key
    }
  }

  dynamic "image_scanning_configuration" {
    for_each = each.value.image_scanning_configuration != null ? each.value.image_scanning_configuration : []
    content {
      scan_on_push = image_scanning_configuration.value.scan_on_push
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
