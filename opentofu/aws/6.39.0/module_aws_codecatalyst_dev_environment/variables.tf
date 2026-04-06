variable "codecatalyst_dev_environments" {
  description = <<EOT
Map of codecatalyst_dev_environments, attributes below
Required:
    - instance_type
    - project_name
    - space_name
    - ides
    - persistent_storage
Optional:
    - alias
    - inactivity_timeout_minutes
    - region
    - repositories
EOT

  type = map(object({
    instance_type              = string
    project_name               = string
    space_name                 = string
    alias                      = optional(string)
    inactivity_timeout_minutes = optional(number)
    region                     = optional(string)
    ides                       = list(object({
            name    = optional(string)
            runtime = optional(string)
        }))
    persistent_storage         = list(object({
            size = number
        }))
    repositories               = optional(list(object({
            repository_name = string
            branch_name     = optional(string)
        })))
  }))
}
