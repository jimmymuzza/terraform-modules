variable "resiliencehubv2_service_functions" {
  description = <<EOT
Map of resiliencehubv2_service_functions, attributes below
Required:
    - criticality
    - name
    - service_arn
Optional:
    - description
    - region
EOT

  type = map(object({
    criticality = string
    name        = string
    service_arn = string
    description = optional(string)
    region      = optional(string)
  }))
}
