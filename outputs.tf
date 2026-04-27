output "alb_dns_name" {
  description = "The public DNS name of the ALB"
  value       = module.alb.alb_dns_name
}

output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "instance_ids" {
  description = "The EC2 instance IDs"
  value       = module.ec2.instance_ids
}
