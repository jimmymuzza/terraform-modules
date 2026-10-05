resource "aws_comprehend_entity_recognizer" "comprehend_entity_recognizers" {
  for_each = var.comprehend_entity_recognizers

  data_access_role_arn = each.value.data_access_role_arn
  language_code        = each.value.language_code
  name                 = each.value.name
  model_kms_key_id     = each.value.model_kms_key_id
  region               = each.value.region
  tags                 = each.value.tags
  tags_all             = each.value.tags_all
  version_name         = each.value.version_name
  version_name_prefix  = each.value.version_name_prefix
  volume_kms_key_id    = each.value.volume_kms_key_id

  dynamic "input_data_config" {
    for_each = each.value.input_data_config != null ? each.value.input_data_config : []
    content {
      data_format = input_data_config.value.data_format

      dynamic "annotations" {
        for_each = input_data_config.value.annotations != null ? input_data_config.value.annotations : []
        content {
          s3_uri      = annotations.value.s3_uri
          test_s3_uri = annotations.value.test_s3_uri
        }
      }

      dynamic "augmented_manifests" {
        for_each = input_data_config.value.augmented_manifests != null ? input_data_config.value.augmented_manifests : []
        content {
          attribute_names         = augmented_manifests.value.attribute_names
          s3_uri                  = augmented_manifests.value.s3_uri
          annotation_data_s3_uri  = augmented_manifests.value.annotation_data_s3_uri
          document_type           = augmented_manifests.value.document_type
          source_documents_s3_uri = augmented_manifests.value.source_documents_s3_uri
          split                   = augmented_manifests.value.split
        }
      }

      dynamic "documents" {
        for_each = input_data_config.value.documents != null ? input_data_config.value.documents : []
        content {
          s3_uri       = documents.value.s3_uri
          input_format = documents.value.input_format
          test_s3_uri  = documents.value.test_s3_uri
        }
      }

      dynamic "entity_list" {
        for_each = input_data_config.value.entity_list != null ? input_data_config.value.entity_list : []
        content {
          s3_uri = entity_list.value.s3_uri
        }
      }

      dynamic "entity_types" {
        for_each = input_data_config.value.entity_types != null ? input_data_config.value.entity_types : []
        content {
          type = entity_types.value.type
        }
      }
    }
  }

  dynamic "vpc_config" {
    for_each = each.value.vpc_config != null ? each.value.vpc_config : []
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnets            = vpc_config.value.subnets
    }
  }
}
