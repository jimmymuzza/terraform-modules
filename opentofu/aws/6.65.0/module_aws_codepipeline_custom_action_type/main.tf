resource "aws_codepipeline_custom_action_type" "codepipeline_custom_action_types" {
  for_each = var.codepipeline_custom_action_types

  category      = each.value.category
  provider_name = each.value.provider_name
  version       = each.value.version
  region        = each.value.region
  tags          = each.value.tags
  tags_all      = each.value.tags_all

  dynamic "configuration_property" {
    for_each = each.value.configuration_property != null ? each.value.configuration_property : []
    content {
      key         = configuration_property.value.key
      name        = configuration_property.value.name
      required    = configuration_property.value.required
      secret      = configuration_property.value.secret
      description = configuration_property.value.description
      queryable   = configuration_property.value.queryable
      type        = configuration_property.value.type
    }
  }

  dynamic "input_artifact_details" {
    for_each = each.value.input_artifact_details != null ? each.value.input_artifact_details : []
    content {
      maximum_count = input_artifact_details.value.maximum_count
      minimum_count = input_artifact_details.value.minimum_count
    }
  }

  dynamic "output_artifact_details" {
    for_each = each.value.output_artifact_details != null ? each.value.output_artifact_details : []
    content {
      maximum_count = output_artifact_details.value.maximum_count
      minimum_count = output_artifact_details.value.minimum_count
    }
  }

  dynamic "settings" {
    for_each = each.value.settings != null ? each.value.settings : []
    content {
      entity_url_template           = settings.value.entity_url_template
      execution_url_template        = settings.value.execution_url_template
      revision_url_template         = settings.value.revision_url_template
      third_party_configuration_url = settings.value.third_party_configuration_url
    }
  }
}
