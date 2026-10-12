resource "aws_cloudwatch_otel_enrichment" "cloudwatch_otel_enrichments" {
  for_each = var.cloudwatch_otel_enrichments

  region = each.value.region
}
