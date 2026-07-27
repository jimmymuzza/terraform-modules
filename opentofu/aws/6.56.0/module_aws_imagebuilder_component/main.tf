resource "aws_imagebuilder_component" "imagebuilder_components" {
  for_each = var.imagebuilder_components

  name                  = each.value.name
  platform              = each.value.platform
  version               = each.value.version
  change_description    = each.value.change_description
  data                  = each.value.data
  description           = each.value.description
  kms_key_id            = each.value.kms_key_id
  region                = each.value.region
  skip_destroy          = each.value.skip_destroy
  supported_os_versions = each.value.supported_os_versions
  tags                  = each.value.tags
  tags_all              = each.value.tags_all
  uri                   = each.value.uri
}
