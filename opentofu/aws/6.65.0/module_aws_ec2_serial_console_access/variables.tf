variable "ec2_serial_console_accesses" {
  description = <<EOT
Map of ec2_serial_console_accesses, attributes below
Optional:
    - enabled
    - region
EOT

  type = map(object({
    enabled = optional(bool)
    region  = optional(string)
  }))
}
