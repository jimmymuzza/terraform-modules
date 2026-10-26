resource "aws_kendra_experience" "kendra_experiences" {
  for_each = var.kendra_experiences

  index_id    = each.value.index_id
  name        = each.value.name
  role_arn    = each.value.role_arn
  description = each.value.description
  region      = each.value.region

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {

      dynamic "content_source_configuration" {
        for_each = configuration.value.content_source_configuration != null ? configuration.value.content_source_configuration : []
        content {
          data_source_ids    = content_source_configuration.value.data_source_ids
          direct_put_content = content_source_configuration.value.direct_put_content
          faq_ids            = content_source_configuration.value.faq_ids
        }
      }

      dynamic "user_identity_configuration" {
        for_each = configuration.value.user_identity_configuration != null ? configuration.value.user_identity_configuration : []
        content {
          identity_attribute_name = user_identity_configuration.value.identity_attribute_name
        }
      }
    }
  }
}
