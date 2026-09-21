variable "connect_contact_flow_modules" {
  description = <<EOT
Map of connect_contact_flow_modules, attributes below
Required:
    - instance_id
    - name
Optional:
    - content
    - content_hash
    - description
    - filename
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    instance_id  = string
    name         = string
    content      = optional(string)
    content_hash = optional(string)
    description  = optional(string)
    filename     = optional(string)
    region       = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
  }))
}
