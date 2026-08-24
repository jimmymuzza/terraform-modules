variable "resiliencehubv2_user_journeys" {
  description = <<EOT
Map of resiliencehubv2_user_journeys, attributes below
Required:
    - name
    - system_arn
Optional:
    - description
    - policy_arn
    - region
EOT

  type = map(object({
    name        = string
    system_arn  = string
    description = optional(string)
    policy_arn  = optional(string)
    region      = optional(string)
  }))
}
