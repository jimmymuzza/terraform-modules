output "cloudfront_origin_access_identities" {
  description = "All cloudfront_origin_access_identity resources"
  value       = aws_cloudfront_origin_access_identity.cloudfront_origin_access_identities
}
