variable "comprehend_entity_recognizers" {
  description = <<EOT
Map of comprehend_entity_recognizers, attributes below
Required:
    - data_access_role_arn
    - language_code
    - name
    - input_data_config
Optional:
    - model_kms_key_id
    - region
    - tags
    - tags_all
    - version_name
    - version_name_prefix
    - volume_kms_key_id
    - vpc_config
EOT

  type = map(object({
    data_access_role_arn = string
    language_code        = string
    name                 = string
    model_kms_key_id     = optional(string)
    region               = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    version_name         = optional(string)
    version_name_prefix  = optional(string)
    volume_kms_key_id    = optional(string)
    input_data_config    = list(object({
            data_format         = optional(string)
            annotations         = optional(list(object({
                s3_uri      = string
                test_s3_uri = optional(string)
            })))
            augmented_manifests = optional(set(object({
                attribute_names         = list(string)
                s3_uri                  = string
                annotation_data_s3_uri  = optional(string)
                document_type           = optional(string)
                source_documents_s3_uri = optional(string)
                split                   = optional(string)
            })))
            documents           = optional(list(object({
                s3_uri       = string
                input_format = optional(string)
                test_s3_uri  = optional(string)
            })))
            entity_list         = optional(list(object({
                s3_uri = string
            })))
            entity_types        = set(object({
                type = string
            }))
        }))
    vpc_config           = optional(list(object({
            security_group_ids = set(string)
            subnets            = set(string)
        })))
  }))
}
