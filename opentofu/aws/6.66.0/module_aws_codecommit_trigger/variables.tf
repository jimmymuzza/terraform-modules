variable "codecommit_triggers" {
  description = <<EOT
Map of codecommit_triggers, attributes below
Required:
    - repository_name
    - trigger
Optional:
    - region
EOT

  type = map(object({
    repository_name = string
    region          = optional(string)
    trigger         = set(object({
            destination_arn = string
            events          = list(string)
            name            = string
            branches        = optional(list(string))
            custom_data     = optional(string)
        }))
  }))
}
