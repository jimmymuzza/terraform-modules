variable "new_relic_monitors" {
  description = <<EOT
Map of new_relic_monitors, attributes below
Required:
    - location
    - name
    - resource_group_name
    - plan
    - user
Optional:
    - account_creation_source
    - account_id
    - ingestion_key
    - org_creation_source
    - organization_id
    - user_id
    - identity
EOT

  type = map(object({
    location                = string
    name                    = string
    resource_group_name     = string
    account_creation_source = optional(string)
    account_id              = optional(string)
    ingestion_key           = optional(string)
    org_creation_source     = optional(string)
    organization_id         = optional(string)
    user_id                 = optional(string)
    identity                = optional(list(object({
            type = string
        })))
    plan                    = list(object({
            effective_date = string
            billing_cycle  = optional(string)
            plan_id        = optional(string)
            usage_type     = optional(string)
        }))
    user                    = list(object({
            email        = string
            first_name   = string
            last_name    = string
            phone_number = string
        }))
  }))
}
