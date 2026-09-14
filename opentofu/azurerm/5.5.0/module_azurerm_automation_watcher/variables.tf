variable "automation_watchers" {
  description = <<EOT
Map of automation_watchers, attributes below
Required:
    - automation_account_id
    - execution_frequency_in_seconds
    - location
    - name
    - script_name
    - script_run_on
Optional:
    - description
    - etag
    - script_parameters
    - tags
EOT

  type = map(object({
    automation_account_id          = string
    execution_frequency_in_seconds = number
    location                       = string
    name                           = string
    script_name                    = string
    script_run_on                  = string
    description                    = optional(string)
    etag                           = optional(string)
    script_parameters              = optional(map(string))
    tags                           = optional(map(string))
  }))
}
