variable "ce_cost_allocation_tags" {
  description = <<EOT
Map of ce_cost_allocation_tags, attributes below
Required:
    - status
    - tag_key
EOT

  type = map(object({
    status  = string
    tag_key = string
  }))
}
