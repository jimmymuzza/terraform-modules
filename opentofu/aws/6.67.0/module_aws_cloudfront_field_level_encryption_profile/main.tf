resource "aws_cloudfront_field_level_encryption_profile" "cloudfront_field_level_encryption_profiles" {
  for_each = var.cloudfront_field_level_encryption_profiles

  name    = each.value.name
  comment = each.value.comment

  dynamic "encryption_entities" {
    for_each = each.value.encryption_entities != null ? each.value.encryption_entities : []
    content {

      dynamic "items" {
        for_each = encryption_entities.value.items != null ? encryption_entities.value.items : []
        content {
          provider_id   = items.value.provider_id
          public_key_id = items.value.public_key_id

          dynamic "field_patterns" {
            for_each = items.value.field_patterns != null ? items.value.field_patterns : []
            content {
              items = field_patterns.value.items
            }
          }
        }
      }
    }
  }
}
