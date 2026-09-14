output "kinesis_streams" {
  description = "All kinesis_stream resources"
  value       = aws_kinesis_stream.kinesis_streams
}
