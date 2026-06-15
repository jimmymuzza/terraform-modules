variable "cloudhsm_v2_hsms" {
  description = <<EOT
Map of cloudhsm_v2_hsms, attributes below
Required:
    - cluster_id
Optional:
    - availability_zone
    - ip_address
    - region
    - subnet_id
EOT

  type = map(object({
    cluster_id        = string
    availability_zone = optional(string)
    ip_address        = optional(string)
    region            = optional(string)
    subnet_id         = optional(string)
  }))
}
