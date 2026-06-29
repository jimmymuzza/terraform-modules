resource "aws_imagebuilder_workflow" "imagebuilder_workflows" {
  for_each = var.imagebuilder_workflows

  name               = each.value.name
  type               = each.value.type
  version            = each.value.version
  change_description = each.value.change_description
  data               = each.value.data
  description        = each.value.description
  kms_key_id         = each.value.kms_key_id
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all
  uri                = each.value.uri
}
