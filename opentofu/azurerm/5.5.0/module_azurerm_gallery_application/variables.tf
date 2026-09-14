variable "gallery_applications" {
  description = <<EOT
Map of gallery_applications, attributes below
Required:
    - gallery_id
    - location
    - name
    - supported_os_type
Optional:
    - description
    - end_of_life_date
    - eula
    - privacy_statement_uri
    - release_note_uri
    - tags
EOT

  type = map(object({
    gallery_id            = string
    location              = string
    name                  = string
    supported_os_type     = string
    description           = optional(string)
    end_of_life_date      = optional(string)
    eula                  = optional(string)
    privacy_statement_uri = optional(string)
    release_note_uri      = optional(string)
    tags                  = optional(map(string))
  }))
}
