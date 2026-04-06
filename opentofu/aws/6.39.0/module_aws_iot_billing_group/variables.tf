variable "iot_billing_groups" {
  description = <<EOT
Map of iot_billing_groups, attributes below
Required:
    - name
Optional:
    - region
    - tags
    - properties
EOT

  type = map(object({
    name       = string
    region     = optional(string)
    tags       = optional(map(string))
    properties = optional(list(object({
            description = optional(string)
        })))
  }))
}
