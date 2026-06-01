variable "kms_grants" {
  description = <<EOT
Map of kms_grants, attributes below
Required:
    - grantee_principal
    - key_id
    - operations
Optional:
    - grant_creation_tokens
    - name
    - region
    - retire_on_delete
    - retiring_principal
    - constraints
EOT

  type = map(object({
    grantee_principal     = string
    key_id                = string
    operations            = set(string)
    grant_creation_tokens = optional(set(string))
    name                  = optional(string)
    region                = optional(string)
    retire_on_delete      = optional(bool)
    retiring_principal    = optional(string)
    constraints           = optional(set(object({
            encryption_context_equals = optional(map(string))
            encryption_context_subset = optional(map(string))
        })))
  }))
}
