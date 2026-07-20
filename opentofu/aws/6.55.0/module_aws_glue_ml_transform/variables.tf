variable "glue_ml_transforms" {
  description = <<EOT
Map of glue_ml_transforms, attributes below
Required:
    - name
    - role_arn
    - input_record_tables
    - parameters
Optional:
    - description
    - glue_version
    - max_capacity
    - max_retries
    - number_of_workers
    - region
    - tags
    - tags_all
    - timeout
    - worker_type
EOT

  type = map(object({
    name                = string
    role_arn            = string
    description         = optional(string)
    glue_version        = optional(string)
    max_capacity        = optional(number)
    max_retries         = optional(number)
    number_of_workers   = optional(number)
    region              = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
    timeout             = optional(number)
    worker_type         = optional(string)
    input_record_tables = list(object({
            database_name   = string
            table_name      = string
            catalog_id      = optional(string)
            connection_name = optional(string)
        }))
    parameters          = list(object({
            transform_type          = string
            find_matches_parameters = list(object({
                accuracy_cost_trade_off    = optional(number)
                enforce_provided_labels    = optional(bool)
                precision_recall_trade_off = optional(number)
                primary_key_column_name    = optional(string)
            }))
        }))
  }))
}
