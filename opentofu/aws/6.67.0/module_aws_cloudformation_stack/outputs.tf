output "cloudformation_stacks" {
  description = "All cloudformation_stack resources"
  value       = aws_cloudformation_stack.cloudformation_stacks
}
