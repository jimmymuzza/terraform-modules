variable "elb_attachments" {
  description = <<EOT
Map of elb_attachments, attributes below
Required:
    - elb
    - instance
Optional:
    - region
EOT

  type = map(object({
    elb      = string
    instance = string
    region   = optional(string)
  }))
}
