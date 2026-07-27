variable "waf_ipsets" {
  description = <<EOT
Map of waf_ipsets, attributes below
Required:
    - name
Optional:
    - ip_set_descriptors
EOT

  type = map(object({
    name               = string
    ip_set_descriptors = optional(set(object({
            type  = string
            value = string
        })))
  }))
}
