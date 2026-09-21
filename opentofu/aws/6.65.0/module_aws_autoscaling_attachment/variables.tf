variable "autoscaling_attachments" {
  description = <<EOT
Map of autoscaling_attachments, attributes below
Required:
    - autoscaling_group_name
Optional:
    - elb
    - lb_target_group_arn
    - region
EOT

  type = map(object({
    autoscaling_group_name = string
    elb                    = optional(string)
    lb_target_group_arn    = optional(string)
    region                 = optional(string)
  }))
}
