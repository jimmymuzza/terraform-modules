output "redshift_snapshot_schedules" {
  description = "All redshift_snapshot_schedule resources"
  value       = aws_redshift_snapshot_schedule.redshift_snapshot_schedules
}
