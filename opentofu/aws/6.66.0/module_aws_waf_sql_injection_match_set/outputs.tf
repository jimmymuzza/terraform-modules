output "waf_sql_injection_match_sets" {
  description = "All waf_sql_injection_match_set resources"
  value       = aws_waf_sql_injection_match_set.waf_sql_injection_match_sets
}
