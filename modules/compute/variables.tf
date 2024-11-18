# modules/compute/variables.tf

variable "vpc_id" {
  description = "VPC ID"
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "ami_id" {
  description = "AMI ID for the instance"
}

variable "security_group_id" {
  description = "Security group ID for instances"
}

variable "key_name" {
  type = string
  description = "Key pair name for SSH access"
  default = "terraform-key-pair-001"
}
