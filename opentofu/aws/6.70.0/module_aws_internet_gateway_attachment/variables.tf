variable "internet_gateway_attachments" {
  description = <<EOT
Map of internet_gateway_attachments, attributes below
Required:
    - internet_gateway_id
    - vpc_id
Optional:
    - region
EOT

  type = map(object({
    internet_gateway_id = string
    vpc_id              = string
    region              = optional(string)
  }))
}
