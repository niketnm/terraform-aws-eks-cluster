resource "aws_eks_cluster" "eks" {
  name = var.cluster_name

  version = var.k8s_version

  role_arn = aws_iam_role.cluster.arn

  vpc_config {
    security_group_ids = [aws_security_group.eks_cluster_sg.id]
    subnet_ids         = var.aws_private_subnet_ids
  }

  instance_types = var.instance_types

  depends_on = [
    aws_iam_role_policy_attachment.cluster_EKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSServicePolicy,
  ]
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = var.cluster-name
  node_group_name = "${var.cluster-name}-default-node-group"
  node_role_arn   = aws_iam_role.node_role.arn
  subnet_ids      = var.aws_private_subnet_ids
  instance_types = [
    var.instance_type
  ]
  depends_on = [
    aws_eks_cluster.eks,
    aws_iam_role_policy_attachment.node_EKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node_EKS_CNI_Policy
  ]
  tags = {
    Name = "${var.cluster-name}-default-node-group"
  }
}