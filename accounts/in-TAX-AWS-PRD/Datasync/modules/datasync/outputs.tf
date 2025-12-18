output "agent_arn" {
  description = "ARN of the DataSync agent"
  value       = aws_datasync_agent.this.arn
}

output "agent_id" {
  description = "ID of the DataSync agent"
  value       = aws_datasync_agent.this.id
}
