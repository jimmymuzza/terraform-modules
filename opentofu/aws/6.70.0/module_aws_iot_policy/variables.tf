variable "iot_policies" {
  description = <<EOT
Map of iot_policies, attributes below
Required:
    - name
    - policy
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name     = string
    policy   = string
    region   = optional(string)
    tags     = optional(map(string))
    tags_all = optional(map(string))
  }))
}
