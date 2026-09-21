resource "aws_kendra_index" "kendra_indexes" {
  for_each = var.kendra_indexes

  name                = each.value.name
  role_arn            = each.value.role_arn
  description         = each.value.description
  edition             = each.value.edition
  region              = each.value.region
  tags                = each.value.tags
  tags_all            = each.value.tags_all
  user_context_policy = each.value.user_context_policy

  dynamic "capacity_units" {
    for_each = each.value.capacity_units != null ? each.value.capacity_units : []
    content {
      query_capacity_units   = capacity_units.value.query_capacity_units
      storage_capacity_units = capacity_units.value.storage_capacity_units
    }
  }

  dynamic "document_metadata_configuration_updates" {
    for_each = each.value.document_metadata_configuration_updates != null ? each.value.document_metadata_configuration_updates : []
    content {
      name = document_metadata_configuration_updates.value.name
      type = document_metadata_configuration_updates.value.type

      dynamic "relevance" {
        for_each = document_metadata_configuration_updates.value.relevance != null ? document_metadata_configuration_updates.value.relevance : []
        content {
          duration              = relevance.value.duration
          freshness             = relevance.value.freshness
          importance            = relevance.value.importance
          rank_order            = relevance.value.rank_order
          values_importance_map = relevance.value.values_importance_map
        }
      }

      dynamic "search" {
        for_each = document_metadata_configuration_updates.value.search != null ? document_metadata_configuration_updates.value.search : []
        content {
          displayable = search.value.displayable
          facetable   = search.value.facetable
          searchable  = search.value.searchable
          sortable    = search.value.sortable
        }
      }
    }
  }

  dynamic "server_side_encryption_configuration" {
    for_each = each.value.server_side_encryption_configuration != null ? each.value.server_side_encryption_configuration : []
    content {
      kms_key_id = server_side_encryption_configuration.value.kms_key_id
    }
  }

  dynamic "user_group_resolution_configuration" {
    for_each = each.value.user_group_resolution_configuration != null ? each.value.user_group_resolution_configuration : []
    content {
      user_group_resolution_mode = user_group_resolution_configuration.value.user_group_resolution_mode
    }
  }

  dynamic "user_token_configurations" {
    for_each = each.value.user_token_configurations != null ? each.value.user_token_configurations : []
    content {

      dynamic "json_token_type_configuration" {
        for_each = user_token_configurations.value.json_token_type_configuration != null ? user_token_configurations.value.json_token_type_configuration : []
        content {
          group_attribute_field     = json_token_type_configuration.value.group_attribute_field
          user_name_attribute_field = json_token_type_configuration.value.user_name_attribute_field
        }
      }

      dynamic "jwt_token_type_configuration" {
        for_each = user_token_configurations.value.jwt_token_type_configuration != null ? user_token_configurations.value.jwt_token_type_configuration : []
        content {
          key_location              = jwt_token_type_configuration.value.key_location
          claim_regex               = jwt_token_type_configuration.value.claim_regex
          group_attribute_field     = jwt_token_type_configuration.value.group_attribute_field
          issuer                    = jwt_token_type_configuration.value.issuer
          secrets_manager_arn       = jwt_token_type_configuration.value.secrets_manager_arn
          url                       = jwt_token_type_configuration.value.url
          user_name_attribute_field = jwt_token_type_configuration.value.user_name_attribute_field
        }
      }
    }
  }
}
