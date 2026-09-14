output "cloudwatch_log_streams" {
  description = "All cloudwatch_log_stream resources"
  value       = aws_cloudwatch_log_stream.cloudwatch_log_streams
}
