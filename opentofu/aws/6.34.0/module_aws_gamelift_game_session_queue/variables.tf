variable "gamelift_game_session_queues" {
  description = <<EOT
Map of gamelift_game_session_queues, attributes below
Required:
    - name
Optional:
    - custom_event_data
    - destinations
    - notification_target
    - region
    - tags
    - tags_all
    - timeout_in_seconds
    - player_latency_policy
EOT

  type = map(object({
    name                  = string
    custom_event_data     = optional(string)
    destinations          = optional(list(string))
    notification_target   = optional(string)
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    timeout_in_seconds    = optional(number)
    player_latency_policy = optional(list(object({
            maximum_individual_player_latency_milliseconds = number
            policy_duration_seconds                        = optional(number)
        })))
  }))
}
