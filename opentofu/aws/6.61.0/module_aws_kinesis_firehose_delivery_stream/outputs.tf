output "kinesis_firehose_delivery_streams" {
  description = "All kinesis_firehose_delivery_stream resources"
  value       = aws_kinesis_firehose_delivery_stream.kinesis_firehose_delivery_streams
}
