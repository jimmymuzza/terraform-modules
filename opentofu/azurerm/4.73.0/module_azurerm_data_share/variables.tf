variable "data_shares" {
  description = <<EOT
Map of data_shares, attributes below
Required:
    - account_id
    - kind
    - name
Optional:
    - description
    - terms
    - snapshot_schedule
EOT

  type = map(object({
    account_id        = string
    kind              = string
    name              = string
    description       = optional(string)
    terms             = optional(string)
    snapshot_schedule = optional(list(object({
            name       = string
            recurrence = string
            start_time = string
        })))
  }))
}
