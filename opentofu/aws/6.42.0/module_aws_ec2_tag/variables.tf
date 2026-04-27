variable "ec2_tags" {
  description = <<EOT
Map of ec2_tags, attributes below
Required:
    - key
    - resource_id
    - value
Optional:
    - region
EOT

  type = map(object({
    key         = string
    resource_id = string
    value       = string
    region      = optional(string)
  }))
}
