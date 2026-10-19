variable "account_regions" {
  description = <<EOT
Map of account_regions, attributes below
Required:
    - enabled
    - region_name
Optional:
    - account_id
EOT

  type = map(object({
    enabled     = bool
    region_name = string
    account_id  = optional(string)
  }))
}
