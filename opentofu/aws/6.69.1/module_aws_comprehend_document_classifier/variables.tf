variable "comprehend_document_classifiers" {
  description = <<EOT
Map of comprehend_document_classifiers, attributes below
Required:
    - data_access_role_arn
    - language_code
    - name
    - input_data_config
Optional:
    - mode
    - model_kms_key_id
    - region
    - tags
    - tags_all
    - version_name
    - version_name_prefix
    - volume_kms_key_id
    - output_data_config
    - vpc_config
EOT

  type = map(object({
    data_access_role_arn = string
    language_code        = string
    name                 = string
    mode                 = optional(string)
    model_kms_key_id     = optional(string)
    region               = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    version_name         = optional(string)
    version_name_prefix  = optional(string)
    volume_kms_key_id    = optional(string)
    input_data_config    = list(object({
            data_format         = optional(string)
            label_delimiter     = optional(string)
            s3_uri              = optional(string)
            test_s3_uri         = optional(string)
            augmented_manifests = optional(set(object({
                attribute_names         = list(string)
                s3_uri                  = string
                annotation_data_s3_uri  = optional(string)
                document_type           = optional(string)
                source_documents_s3_uri = optional(string)
                split                   = optional(string)
            })))
        }))
    output_data_config   = optional(list(object({
            s3_uri     = string
            kms_key_id = optional(string)
        })))
    vpc_config           = optional(list(object({
            security_group_ids = set(string)
            subnets            = set(string)
        })))
  }))
}
