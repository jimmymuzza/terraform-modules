variable "batch_certificates" {
  description = <<EOT
Map of batch_certificates, attributes below
Required:
    - account_name
    - certificate
    - format
    - resource_group_name
    - thumbprint
    - thumbprint_algorithm
Optional:
    - password
EOT

  type = map(object({
    account_name         = string
    certificate          = string
    format               = string
    resource_group_name  = string
    thumbprint           = string
    thumbprint_algorithm = string
    password             = optional(string)
  }))
}
