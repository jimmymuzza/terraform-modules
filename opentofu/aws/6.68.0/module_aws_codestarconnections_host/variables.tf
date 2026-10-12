variable "codestarconnections_hosts" {
  description = <<EOT
Map of codestarconnections_hosts, attributes below
Required:
    - name
    - provider_endpoint
    - provider_type
Optional:
    - region
    - vpc_configuration
EOT

  type = map(object({
    name              = string
    provider_endpoint = string
    provider_type     = string
    region            = optional(string)
    vpc_configuration = optional(list(object({
            security_group_ids = set(string)
            subnet_ids         = set(string)
            vpc_id             = string
            tls_certificate    = optional(string)
        })))
  }))
}
