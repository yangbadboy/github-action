resource "aws_vpc" "aws-vpc-github-action" {
  cidr_block           = var.aws_network_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "aws-vpc-yang1"
  }
}

data "aws_vpc" "peer" {
  id = "vpc-0c445f5ad3d99c7d8"
}
resource "aws_vpc_peering_connection" "foo" {
  peer_owner_id = "184136210319"
  peer_vpc_id   = aws_vpc.peer.id
  vpc_id        = aws_vpc.faws-vpc-github-action.id
  peer_region   = aws.seoul
  auto_accept   = true
}

