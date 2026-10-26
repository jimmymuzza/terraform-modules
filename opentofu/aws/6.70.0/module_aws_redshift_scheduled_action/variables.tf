variable "redshift_scheduled_actions" {
  description = <<EOT
Map of redshift_scheduled_actions, attributes below
Required:
    - iam_role
    - name
    - schedule
    - target_action
Optional:
    - description
    - enable
    - end_time
    - region
    - start_time
EOT

  type = map(object({
    iam_role      = string
    name          = string
    schedule      = string
    description   = optional(string)
    enable        = optional(bool)
    end_time      = optional(string)
    region        = optional(string)
    start_time    = optional(string)
    target_action = list(object({
            pause_cluster  = optional(list(object({
                cluster_identifier = string
            })))
            resize_cluster = optional(list(object({
                cluster_identifier = string
                classic            = optional(bool)
                cluster_type       = optional(string)
                node_type          = optional(string)
                number_of_nodes    = optional(number)
            })))
            resume_cluster = optional(list(object({
                cluster_identifier = string
            })))
        }))
  }))
}
