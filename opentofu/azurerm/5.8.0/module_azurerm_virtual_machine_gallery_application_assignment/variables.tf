variable "virtual_machine_gallery_application_assignments" {
  description = <<EOT
Map of virtual_machine_gallery_application_assignments, attributes below
Required:
    - gallery_application_version_id
    - virtual_machine_id
Optional:
    - configuration_blob_uri
    - order
    - tag
EOT

  type = map(object({
    gallery_application_version_id = string
    virtual_machine_id             = string
    configuration_blob_uri         = optional(string)
    order                          = optional(number)
    tag                            = optional(string)
  }))
}
