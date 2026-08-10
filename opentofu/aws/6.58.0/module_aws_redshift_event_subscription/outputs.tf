output "redshift_event_subscriptions" {
  description = "All redshift_event_subscription resources"
  value       = aws_redshift_event_subscription.redshift_event_subscriptions
}
