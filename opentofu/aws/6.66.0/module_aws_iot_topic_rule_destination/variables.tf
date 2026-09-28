variable "iot_topic_rule_destinations" {
  description = <<EOT
Map of iot_topic_rule_destinations, attributes below
Required:
    - vpc_configuration
Optional:
    - enabled
    - region
EOT

  type = map(object({
    enabled           = optional(bool)
    region            = optional(string)
    vpc_configuration = list(object({
            role_arn        = string
            subnet_ids      = set(string)
            vpc_id          = string
            security_groups = optional(set(string))
        }))
  }))
}
