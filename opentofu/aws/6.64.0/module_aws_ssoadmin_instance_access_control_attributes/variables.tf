variable "ssoadmin_instance_access_control_attributes" {
  description = <<EOT
Map of ssoadmin_instance_access_control_attributes, attributes below
Required:
    - instance_arn
    - attribute
Optional:
    - region
EOT

  type = map(object({
    instance_arn = string
    region       = optional(string)
    attribute    = set(object({
            key   = string
            value = set(object({
                source = set(string)
            }))
        }))
  }))
}
