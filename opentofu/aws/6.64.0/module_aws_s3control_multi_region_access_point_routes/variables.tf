variable "s3control_multi_region_access_point_routes" {
  description = <<EOT
Map of s3control_multi_region_access_point_routes, attributes below
Required:
    - mrap
Optional:
    - account_id
    - region
    - route
EOT

  type = map(object({
    mrap       = string
    account_id = optional(string)
    region     = optional(string)
    route      = optional(set(object({
            bucket                  = string
            region                  = string
            traffic_dial_percentage = number
        })))
  }))
}
