variable "sentinel_threat_intelligence_indicators" {
  description = <<EOT
Map of sentinel_threat_intelligence_indicators, attributes below
Required:
    - display_name
    - pattern
    - pattern_type
    - source
    - validate_from_utc
    - workspace_id
Optional:
    - confidence
    - created_by
    - description
    - extension
    - language
    - object_marking_refs
    - pattern_version
    - revoked
    - tags
    - threat_types
    - validate_until_utc
    - external_reference
    - granular_marking
    - kill_chain_phase
EOT

  type = map(object({
    display_name        = string
    pattern             = string
    pattern_type        = string
    source              = string
    validate_from_utc   = string
    workspace_id        = string
    confidence          = optional(number)
    created_by          = optional(string)
    description         = optional(string)
    extension           = optional(string)
    language            = optional(string)
    object_marking_refs = optional(list(string))
    pattern_version     = optional(string)
    revoked             = optional(bool)
    tags                = optional(list(string))
    threat_types        = optional(list(string))
    validate_until_utc  = optional(string)
    external_reference  = optional(list(object({
            description = optional(string)
            hashes      = optional(map(string))
            source_name = optional(string)
            url         = optional(string)
        })))
    granular_marking    = optional(list(object({
            language    = optional(string)
            marking_ref = optional(string)
            selectors   = optional(list(string))
        })))
    kill_chain_phase    = optional(list(object({
            name = optional(string)
        })))
  }))
}
