variable "detective_invitation_accepters" {
  description = <<EOT
Map of detective_invitation_accepters, attributes below
Required:
    - graph_arn
Optional:
    - region
EOT

  type = map(object({
    graph_arn = string
    region    = optional(string)
  }))
}
