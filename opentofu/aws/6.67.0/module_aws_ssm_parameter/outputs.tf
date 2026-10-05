output "ssm_parameters" {
  description = "All ssm_parameter resources"
  value       = aws_ssm_parameter.ssm_parameters
}
