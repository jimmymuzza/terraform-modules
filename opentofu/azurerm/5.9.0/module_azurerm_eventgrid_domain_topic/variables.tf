variable "eventgrid_domain_topics" {
  description = <<EOT
Map of eventgrid_domain_topics, attributes below
Required:
    - domain_name
    - name
    - resource_group_name
EOT

  type = map(object({
    domain_name         = string
    name                = string
    resource_group_name = string
  }))
}
