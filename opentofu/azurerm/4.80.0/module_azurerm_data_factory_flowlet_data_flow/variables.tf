variable "data_factory_flowlet_data_flows" {
  description = <<EOT
Map of data_factory_flowlet_data_flows, attributes below
Required:
    - data_factory_id
    - name
Optional:
    - annotations
    - description
    - folder
    - script
    - script_lines
    - sink
    - source
    - transformation
EOT

  type = map(object({
    data_factory_id = string
    name            = string
    annotations     = optional(list(string))
    description     = optional(string)
    folder          = optional(string)
    script          = optional(string)
    script_lines    = optional(list(string))
    sink            = optional(list(object({
            name                    = string
            description             = optional(string)
            dataset                 = optional(list(object({
                name       = string
                parameters = optional(map(string))
            })))
            flowlet                 = optional(list(object({
                name               = string
                dataset_parameters = optional(string)
                parameters         = optional(map(string))
            })))
            linked_service          = optional(list(object({
                name       = string
                parameters = optional(map(string))
            })))
            rejected_linked_service = optional(list(object({
                name       = string
                parameters = optional(map(string))
            })))
            schema_linked_service   = optional(list(object({
                name       = string
                parameters = optional(map(string))
            })))
        })))
    source          = optional(list(object({
            name                    = string
            description             = optional(string)
            dataset                 = optional(list(object({
                name       = string
                parameters = optional(map(string))
            })))
            flowlet                 = optional(list(object({
                name               = string
                dataset_parameters = optional(string)
                parameters         = optional(map(string))
            })))
            linked_service          = optional(list(object({
                name       = string
                parameters = optional(map(string))
            })))
            rejected_linked_service = optional(list(object({
                name       = string
                parameters = optional(map(string))
            })))
            schema_linked_service   = optional(list(object({
                name       = string
                parameters = optional(map(string))
            })))
        })))
    transformation  = optional(list(object({
            name           = string
            description    = optional(string)
            dataset        = optional(list(object({
                name       = string
                parameters = optional(map(string))
            })))
            flowlet        = optional(list(object({
                name               = string
                dataset_parameters = optional(string)
                parameters         = optional(map(string))
            })))
            linked_service = optional(list(object({
                name       = string
                parameters = optional(map(string))
            })))
        })))
  }))
}
