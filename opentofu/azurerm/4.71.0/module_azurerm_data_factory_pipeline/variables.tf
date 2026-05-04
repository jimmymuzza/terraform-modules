variable "data_factory_pipelines" {
  description = <<EOT
Map of data_factory_pipelines, attributes below
Required:
    - data_factory_id
    - name
Optional:
    - activities_json
    - annotations
    - concurrency
    - description
    - folder
    - moniter_metrics_after_duration
    - parameters
    - variables
EOT

  type = map(object({
    data_factory_id                = string
    name                           = string
    activities_json                = optional(string)
    annotations                    = optional(list(string))
    concurrency                    = optional(number)
    description                    = optional(string)
    folder                         = optional(string)
    moniter_metrics_after_duration = optional(string)
    parameters                     = optional(map(string))
    variables                      = optional(map(string))
  }))
}
