output "waf_ipsets" {
  description = "All waf_ipset resources"
  value       = aws_waf_ipset.waf_ipsets
}
