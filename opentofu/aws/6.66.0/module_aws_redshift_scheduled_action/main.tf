resource "aws_redshift_scheduled_action" "redshift_scheduled_actions" {
  for_each = var.redshift_scheduled_actions

  iam_role    = each.value.iam_role
  name        = each.value.name
  schedule    = each.value.schedule
  description = each.value.description
  enable      = each.value.enable
  end_time    = each.value.end_time
  region      = each.value.region
  start_time  = each.value.start_time

  dynamic "target_action" {
    for_each = each.value.target_action != null ? each.value.target_action : []
    content {

      dynamic "pause_cluster" {
        for_each = target_action.value.pause_cluster != null ? target_action.value.pause_cluster : []
        content {
          cluster_identifier = pause_cluster.value.cluster_identifier
        }
      }

      dynamic "resize_cluster" {
        for_each = target_action.value.resize_cluster != null ? target_action.value.resize_cluster : []
        content {
          cluster_identifier = resize_cluster.value.cluster_identifier
          classic            = resize_cluster.value.classic
          cluster_type       = resize_cluster.value.cluster_type
          node_type          = resize_cluster.value.node_type
          number_of_nodes    = resize_cluster.value.number_of_nodes
        }
      }

      dynamic "resume_cluster" {
        for_each = target_action.value.resume_cluster != null ? target_action.value.resume_cluster : []
        content {
          cluster_identifier = resume_cluster.value.cluster_identifier
        }
      }
    }
  }
}
