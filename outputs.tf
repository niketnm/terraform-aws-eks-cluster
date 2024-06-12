output "cluster_id" {
  value       = aws_eks_cluster.eks.id
}

output "cluster_endpoint" {
  value       = aws_eks_cluster.eks.endpoint
}

output "cluster_arn" {
  value       = aws_eks_cluster.eks.arn
}

output "node_group_id" {
  value       = aws_eks_node_group.node_group.id
}

output "eks_cluster_security_group_id" {
  value       = aws_security_group.eks_cluster_sg.id
}

output "eks_node_security_group_id" {
  value       = aws_security_group.eks_node_sg.id
}