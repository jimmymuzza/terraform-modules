resource "aws_lambdamicrovms_image" "lambdamicrovms_images" {
  for_each = var.lambdamicrovms_images

  base_image_arn             = each.value.base_image_arn
  build_role_arn             = each.value.build_role_arn
  name                       = each.value.name
  additional_os_capabilities = each.value.additional_os_capabilities
  base_image_version         = each.value.base_image_version
  description                = each.value.description
  egress_network_connectors  = each.value.egress_network_connectors
  environment_variables      = each.value.environment_variables
  region                     = each.value.region
  tags                       = each.value.tags

  dynamic "code_artifact" {
    for_each = each.value.code_artifact != null ? each.value.code_artifact : []
    content {
      uri = code_artifact.value.uri
    }
  }

  dynamic "cpu_configuration" {
    for_each = each.value.cpu_configuration != null ? each.value.cpu_configuration : []
    content {
      architecture = cpu_configuration.value.architecture
    }
  }
}
