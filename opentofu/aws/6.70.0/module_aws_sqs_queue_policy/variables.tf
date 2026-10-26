variable "sqs_queue_policies" {
  description = <<EOT
Map of sqs_queue_policies, attributes below
Required:
    - policy
    - queue_url
Optional:
    - region
EOT

  type = map(object({
    policy    = string
    queue_url = string
    region    = optional(string)
  }))
}
