variable "lambdamicrovms_images" {
  description = <<EOT
Map of lambdamicrovms_images, attributes below
Required:
    - base_image_arn
    - build_role_arn
    - name
Optional:
    - additional_os_capabilities
    - base_image_version
    - description
    - egress_network_connectors
    - environment_variables
    - region
    - tags
    - code_artifact
    - cpu_configuration
EOT

  type = map(object({
    base_image_arn             = string
    build_role_arn             = string
    name                       = string
    additional_os_capabilities = optional(list(string))
    base_image_version         = optional(string)
    description                = optional(string)
    egress_network_connectors  = optional(list(string))
    environment_variables      = optional(map(string))
    region                     = optional(string)
    tags                       = optional(map(string))
    code_artifact              = optional(list(object({
            uri = string
        })))
    cpu_configuration          = optional(list(object({
            architecture = string
        })))
  }))
}
