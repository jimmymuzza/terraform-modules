output "kinesis_stream_consumers" {
  description = "All kinesis_stream_consumer resources"
  value       = aws_kinesis_stream_consumer.kinesis_stream_consumers
}
