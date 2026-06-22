output "codepipeline_webhooks" {
  description = "All codepipeline_webhook resources"
  value       = aws_codepipeline_webhook.codepipeline_webhooks
}
