variable "xray_trace_segment_destinations" {
  description = <<EOT
Map of xray_trace_segment_destinations, attributes below
Required:
    - destination
Optional:
    - region
EOT

  type = map(object({
    destination = string
    region      = optional(string)
  }))
}
