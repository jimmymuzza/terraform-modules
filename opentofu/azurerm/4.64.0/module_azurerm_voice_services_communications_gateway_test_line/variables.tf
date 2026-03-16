variable "voice_services_communications_gateway_test_lines" {
  description = <<EOT
Map of voice_services_communications_gateway_test_lines, attributes below
Required:
    - location
    - name
    - phone_number
    - purpose
    - voice_services_communications_gateway_id
Optional:
    - tags
EOT

  type = map(object({
    location                                 = string
    name                                     = string
    phone_number                             = string
    purpose                                  = string
    voice_services_communications_gateway_id = string
    tags                                     = optional(map(string))
  }))
}
