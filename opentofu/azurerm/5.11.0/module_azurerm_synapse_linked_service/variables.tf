variable "synapse_linked_services" {
  description = <<EOT
Map of synapse_linked_services, attributes below
Required:
    - name
    - synapse_workspace_id
    - type
    - type_properties_json
Optional:
    - additional_properties
    - annotations
    - description
    - parameters
    - integration_runtime
EOT

  type = map(object({
    name                  = string
    synapse_workspace_id  = string
    type                  = string
    type_properties_json  = string
    additional_properties = optional(map(string))
    annotations           = optional(list(string))
    description           = optional(string)
    parameters            = optional(map(string))
    integration_runtime   = optional(list(object({
            name       = string
            parameters = optional(map(string))
        })))
  }))
}
