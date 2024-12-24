resource "aws_vpc" "aws-vpc-github-action" {
  cidr_block           = var.aws_network_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "aws-vpc-yang1"
  }
}

data "aws_vpc" "peer" {
  provider = aws.seoul
  id = "vpc-0c445f5ad3d99c7d8"
}

resource "aws_vpc_peering_connection" "test_peering" {
  peer_owner_id = "184136210319"
  peer_vpc_id   = data.aws_vpc.peer.id
  vpc_id        = aws_vpc.aws-vpc-github-action.id
  peer_region   = "ap-northeast-2"
  auto_accept   = true
}


data "aws_subnet" "peer" {
  provider = aws.seoul
  id = "subnet-0f948b7e031117087"
}
data "aws_route_table" "peer" {
  provider = aws.seoul
  subnet_id = data.aws_subnet.peer.id
}

resource "aws_route" "route" {
  provider = aws.seoul
  route_table_id            = data.aws_route_table.peer.id
  destination_cidr_block    = var.aws_network_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.test_peering.id
}