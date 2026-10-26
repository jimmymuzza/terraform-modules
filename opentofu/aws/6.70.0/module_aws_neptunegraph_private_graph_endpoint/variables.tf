variable "neptunegraph_private_graph_endpoints" {
  description = <<EOT
Map of neptunegraph_private_graph_endpoints, attributes below
Required:
    - graph_identifier
    - vpc_id
Optional:
    - region
    - subnet_ids
    - vpc_security_group_ids
EOT

  type = map(object({
    graph_identifier       = string
    vpc_id                 = string
    region                 = optional(string)
    subnet_ids             = optional(set(string))
    vpc_security_group_ids = optional(set(string))
  }))
}
