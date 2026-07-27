variable "storage_mover_agents" {
  description = <<EOT
Map of storage_mover_agents, attributes below
Required:
    - arc_virtual_machine_id
    - arc_virtual_machine_uuid
    - name
    - storage_mover_id
Optional:
    - description
EOT

  type = map(object({
    arc_virtual_machine_id   = string
    arc_virtual_machine_uuid = string
    name                     = string
    storage_mover_id         = string
    description              = optional(string)
  }))
}
