variable "ssoadmin_regions" {
  description = <<EOT
Map of ssoadmin_regions, attributes below
Required:
    - instance_arn
    - region_name
Optional:
    - region
EOT

  type = map(object({
    instance_arn = string
    region_name  = string
    region       = optional(string)
  }))
}
