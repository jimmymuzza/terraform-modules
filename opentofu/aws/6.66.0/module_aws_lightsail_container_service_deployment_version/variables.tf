variable "lightsail_container_service_deployment_versions" {
  description = <<EOT
Map of lightsail_container_service_deployment_versions, attributes below
Required:
    - service_name
    - container
Optional:
    - region
    - public_endpoint
EOT

  type = map(object({
    service_name    = string
    region          = optional(string)
    container       = set(object({
            container_name = string
            image          = string
            command        = optional(list(string))
            environment    = optional(map(string))
            ports          = optional(map(string))
        }))
    public_endpoint = optional(list(object({
            container_name = string
            container_port = number
            health_check   = list(object({
                healthy_threshold   = optional(number)
                interval_seconds    = optional(number)
                path                = optional(string)
                success_codes       = optional(string)
                timeout_seconds     = optional(number)
                unhealthy_threshold = optional(number)
            }))
        })))
  }))
}
