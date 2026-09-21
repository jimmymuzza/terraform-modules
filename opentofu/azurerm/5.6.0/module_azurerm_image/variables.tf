variable "images" {
  description = <<EOT
Map of images, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - hyper_v_generation
    - source_virtual_machine_id
    - tags
    - zone_resilient
    - data_disk
    - os_disk
EOT

  type = map(object({
    location                  = string
    name                      = string
    resource_group_name       = string
    hyper_v_generation        = optional(string)
    source_virtual_machine_id = optional(string)
    tags                      = optional(map(string))
    zone_resilient            = optional(bool)
    data_disk                 = optional(list(object({
            storage_type           = string
            blob_uri               = optional(string)
            caching                = optional(string)
            disk_encryption_set_id = optional(string)
            lun                    = optional(number)
            managed_disk_id        = optional(string)
            size_gb                = optional(number)
        })))
    os_disk                   = optional(list(object({
            storage_type           = string
            blob_uri               = optional(string)
            caching                = optional(string)
            disk_encryption_set_id = optional(string)
            managed_disk_id        = optional(string)
            os_state               = optional(string)
            os_type                = optional(string)
            size_gb                = optional(number)
        })))
  }))
}
