variable "shared_images" {
  description = <<EOT
Map of shared_images, attributes below
Required:
    - gallery_name
    - location
    - name
    - os_type
    - resource_group_name
    - identifier
Optional:
    - accelerated_network_support_enabled
    - architecture
    - confidential_vm_enabled
    - confidential_vm_supported
    - description
    - disk_controller_type_nvme_enabled
    - disk_types_not_allowed
    - end_of_life_date
    - eula
    - hibernation_enabled
    - hyper_v_generation
    - max_recommended_memory_in_gb
    - max_recommended_vcpu_count
    - min_recommended_memory_in_gb
    - min_recommended_vcpu_count
    - privacy_statement_uri
    - release_note_uri
    - specialized
    - tags
    - trusted_launch_enabled
    - trusted_launch_supported
    - purchase_plan
EOT

  type = map(object({
    gallery_name                        = string
    location                            = string
    name                                = string
    os_type                             = string
    resource_group_name                 = string
    accelerated_network_support_enabled = optional(bool)
    architecture                        = optional(string)
    confidential_vm_enabled             = optional(bool)
    confidential_vm_supported           = optional(bool)
    description                         = optional(string)
    disk_controller_type_nvme_enabled   = optional(bool)
    disk_types_not_allowed              = optional(set(string))
    end_of_life_date                    = optional(string)
    eula                                = optional(string)
    hibernation_enabled                 = optional(bool)
    hyper_v_generation                  = optional(string)
    max_recommended_memory_in_gb        = optional(number)
    max_recommended_vcpu_count          = optional(number)
    min_recommended_memory_in_gb        = optional(number)
    min_recommended_vcpu_count          = optional(number)
    privacy_statement_uri               = optional(string)
    release_note_uri                    = optional(string)
    specialized                         = optional(bool)
    tags                                = optional(map(string))
    trusted_launch_enabled              = optional(bool)
    trusted_launch_supported            = optional(bool)
    identifier                          = list(object({
            offer     = string
            publisher = string
            sku       = string
        }))
    purchase_plan                       = optional(list(object({
            name      = string
            product   = optional(string)
            publisher = optional(string)
        })))
  }))
}
