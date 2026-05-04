variable "route53recoverycontrolconfig_routing_controls" {
  description = <<EOT
Map of route53recoverycontrolconfig_routing_controls, attributes below
Required:
    - cluster_arn
    - name
Optional:
    - control_panel_arn
EOT

  type = map(object({
    cluster_arn       = string
    name              = string
    control_panel_arn = optional(string)
  }))
}
