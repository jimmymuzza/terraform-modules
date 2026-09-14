variable "network_manager_verifier_workspaces" {
  description = <<EOT
Map of network_manager_verifier_workspaces, attributes below
Required:
    - location
    - name
    - network_manager_id
Optional:
    - description
    - tags
EOT

  type = map(object({
    location           = string
    name               = string
    network_manager_id = string
    description        = optional(string)
    tags               = optional(map(string))
  }))
}
