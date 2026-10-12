output "cloudformation_stack_sets" {
  description = "All cloudformation_stack_set resources"
  value       = aws_cloudformation_stack_set.cloudformation_stack_sets
}
