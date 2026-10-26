variable "route53recoverycontrolconfig_control_panels" {
  description = <<EOT
Map of route53recoverycontrolconfig_control_panels, attributes below
Required:
    - cluster_arn
    - name
Optional:
    - tags
    - tags_all
EOT

  type = map(object({
    cluster_arn = string
    name        = string
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
