variable "ebs_snapshot_block_public_accesses" {
  description = <<EOT
Map of ebs_snapshot_block_public_accesses, attributes below
Required:
    - state
Optional:
    - region
EOT

  type = map(object({
    state  = string
    region = optional(string)
  }))
}
