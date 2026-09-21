resource "aws_gamelift_game_session_queue" "gamelift_game_session_queues" {
  for_each = var.gamelift_game_session_queues

  name                = each.value.name
  custom_event_data   = each.value.custom_event_data
  destinations        = each.value.destinations
  notification_target = each.value.notification_target
  region              = each.value.region
  tags                = each.value.tags
  tags_all            = each.value.tags_all
  timeout_in_seconds  = each.value.timeout_in_seconds

  dynamic "player_latency_policy" {
    for_each = each.value.player_latency_policy != null ? each.value.player_latency_policy : []
    content {
      maximum_individual_player_latency_milliseconds = player_latency_policy.value.maximum_individual_player_latency_milliseconds
      policy_duration_seconds                        = player_latency_policy.value.policy_duration_seconds
    }
  }
}
