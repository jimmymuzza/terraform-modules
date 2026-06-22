variable "workspacesweb_trust_stores" {
  description = <<EOT
Map of workspacesweb_trust_stores, attributes below
Optional:
    - region
    - tags
    - certificate
EOT

  type = map(object({
    region      = optional(string)
    tags        = optional(map(string))
    certificate = optional(set(object({
            body = string
        })))
  }))
}
