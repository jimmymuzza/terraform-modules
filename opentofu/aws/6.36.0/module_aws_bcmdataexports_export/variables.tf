variable "bcmdataexports_exports" {
  description = <<EOT
Map of bcmdataexports_exports, attributes below
Optional:
    - tags
    - export
EOT

  type = map(object({
    tags   = optional(map(string))
    export = optional(list(object({
            name                       = string
            description                = optional(string)
            data_query                 = optional(list(object({
                query_statement      = string
                table_configurations = optional(map(map(string)))
            })))
            destination_configurations = optional(list(object({
                s3_destination = optional(list(object({
                    s3_bucket                = string
                    s3_prefix                = string
                    s3_region                = string
                    s3_output_configurations = optional(list(object({
                        compression = string
                        format      = string
                        output_type = string
                        overwrite   = string
                    })))
                })))
            })))
            refresh_cadence            = optional(list(object({
                frequency = string
            })))
        })))
  }))
}
