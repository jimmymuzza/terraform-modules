variable "data_factory_trigger_blob_events" {
  description = <<EOT
Map of data_factory_trigger_blob_events, attributes below
Required:
    - data_factory_id
    - events
    - name
    - storage_account_id
    - pipeline
Optional:
    - activated
    - additional_properties
    - annotations
    - blob_path_begins_with
    - blob_path_ends_with
    - description
    - ignore_empty_blobs
EOT

  type = map(object({
    data_factory_id       = string
    events                = set(string)
    name                  = string
    storage_account_id    = string
    activated             = optional(bool)
    additional_properties = optional(map(string))
    annotations           = optional(list(string))
    blob_path_begins_with = optional(string)
    blob_path_ends_with   = optional(string)
    description           = optional(string)
    ignore_empty_blobs    = optional(bool)
    pipeline              = set(object({
            name       = string
            parameters = optional(map(string))
        }))
  }))
}
