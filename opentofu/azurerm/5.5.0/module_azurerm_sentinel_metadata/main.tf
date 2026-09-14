resource "azurerm_sentinel_metadata" "sentinel_metadatas" {
  for_each = var.sentinel_metadatas

  content_id                 = each.value.content_id
  kind                       = each.value.kind
  name                       = each.value.name
  parent_id                  = each.value.parent_id
  workspace_id               = each.value.workspace_id
  content_schema_version     = each.value.content_schema_version
  custom_version             = each.value.custom_version
  dependency                 = each.value.dependency
  first_publish_date         = each.value.first_publish_date
  icon_id                    = each.value.icon_id
  last_publish_date          = each.value.last_publish_date
  preview_images             = each.value.preview_images
  preview_images_dark        = each.value.preview_images_dark
  providers                  = each.value.providers
  threat_analysis_tactics    = each.value.threat_analysis_tactics
  threat_analysis_techniques = each.value.threat_analysis_techniques
  version                    = each.value.version

  dynamic "author" {
    for_each = each.value.author != null ? each.value.author : []
    content {
      email = author.value.email
      link  = author.value.link
      name  = author.value.name
    }
  }

  dynamic "category" {
    for_each = each.value.category != null ? each.value.category : []
    content {
      domains   = category.value.domains
      verticals = category.value.verticals
    }
  }

  dynamic "source" {
    for_each = each.value.source != null ? each.value.source : []
    content {
      kind = source.value.kind
      name = source.value.name
    }
  }

  dynamic "support" {
    for_each = each.value.support != null ? each.value.support : []
    content {
      tier  = support.value.tier
      email = support.value.email
      link  = support.value.link
      name  = support.value.name
    }
  }
}
