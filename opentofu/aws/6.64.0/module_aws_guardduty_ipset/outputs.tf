output "guardduty_ipsets" {
  description = "All guardduty_ipset resources"
  value       = aws_guardduty_ipset.guardduty_ipsets
}
