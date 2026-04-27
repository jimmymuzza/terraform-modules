resource "aws_ecrpublic_repository" "ecrpublic_repositories" {
  for_each = var.ecrpublic_repositories

  repository_name = each.value.repository_name
  force_destroy   = each.value.force_destroy
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all

  dynamic "catalog_data" {
    for_each = each.value.catalog_data != null ? each.value.catalog_data : []
    content {
      about_text        = catalog_data.value.about_text
      architectures     = catalog_data.value.architectures
      description       = catalog_data.value.description
      logo_image_blob   = catalog_data.value.logo_image_blob
      operating_systems = catalog_data.value.operating_systems
      usage_text        = catalog_data.value.usage_text
    }
  }
}
