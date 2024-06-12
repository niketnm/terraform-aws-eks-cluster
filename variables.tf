variable "aws_region" {
  default     = "us-east-1"
  type        = string
  description = "The AWS Region to deploy EKS"
}

variable "k8s_version" {
  default = "1.30"
  type    = number
}

variable "vpc_id" {
  type = string
}

variable "aws_private_subnet_ids" {
  type = list(string)
}

variable "cluster_name" {
  type = string
}


