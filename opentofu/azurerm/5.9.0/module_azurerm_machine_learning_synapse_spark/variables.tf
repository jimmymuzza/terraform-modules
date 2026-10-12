variable "machine_learning_synapse_sparks" {
  description = <<EOT
Map of machine_learning_synapse_sparks, attributes below
Required:
    - location
    - machine_learning_workspace_id
    - name
    - synapse_spark_pool_id
Optional:
    - description
    - local_auth_enabled
    - tags
    - identity
EOT

  type = map(object({
    location                      = string
    machine_learning_workspace_id = string
    name                          = string
    synapse_spark_pool_id         = string
    description                   = optional(string)
    local_auth_enabled            = optional(bool)
    tags                          = optional(map(string))
    identity                      = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
