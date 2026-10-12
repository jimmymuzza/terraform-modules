variable "pinpointsmsvoicev2_opt_out_lists" {
  description = <<EOT
Map of pinpointsmsvoicev2_opt_out_lists, attributes below
Required:
    - name
Optional:
    - region
    - tags
EOT

  type = map(object({
    name   = string
    region = optional(string)
    tags   = optional(map(string))
  }))
}
