variable "quicksight_ingestions" {
  description = <<EOT
Map of quicksight_ingestions, attributes below
Required:
    - data_set_id
    - ingestion_id
    - ingestion_type
Optional:
    - aws_account_id
    - region
EOT

  type = map(object({
    data_set_id    = string
    ingestion_id   = string
    ingestion_type = string
    aws_account_id = optional(string)
    region         = optional(string)
  }))
}
