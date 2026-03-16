variable "healthcare_dicom_services" {
  description = <<EOT
Map of healthcare_dicom_services, attributes below
Required:
    - location
    - name
    - workspace_id
Optional:
    - data_partitions_enabled
    - encryption_key_url
    - public_network_access_enabled
    - tags
    - cors
    - identity
    - storage
EOT

  type = map(object({
    location                      = string
    name                          = string
    workspace_id                  = string
    data_partitions_enabled       = optional(bool)
    encryption_key_url            = optional(string)
    public_network_access_enabled = optional(bool)
    tags                          = optional(map(string))
    cors                          = optional(list(object({
            allow_credentials  = optional(bool)
            allowed_headers    = optional(list(string))
            allowed_methods    = optional(list(string))
            allowed_origins    = optional(list(string))
            max_age_in_seconds = optional(number)
        })))
    identity                      = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    storage                       = optional(list(object({
            file_system_name   = string
            storage_account_id = string
        })))
  }))
}
