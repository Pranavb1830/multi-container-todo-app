variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "AWS EC2 Key Pair name"
  type        = string
}

variable "project_name" {
  description = "Project name used for tagging resources"
  type        = string
}

variable "private_key_path" {
  description = "Path to the SSH private key used by Ansible"
  type = string
}

variable "inventory_path" {
  description = "Path where Terraform should generate the Ansible inventory"
  type        = string
}