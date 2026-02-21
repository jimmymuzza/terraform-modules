variable "glue_resource_policies" {
  description = <<EOT
Map of glue_resource_policies, attributes below
Required:
    - policy
Optional:
    - enable_hybrid
    - region
EOT

  type = map(object({
    policy        = string
    enable_hybrid = optional(string)
    region        = optional(string)
  }))
}
