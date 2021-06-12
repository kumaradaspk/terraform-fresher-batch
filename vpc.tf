resource "aws_vpc" "Tech-start-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    instance_tenancy = "default"

    tags = {
        Name = "Tech-start-vpc"
    }
}

resource "aws_subnet" "Tech-start-subnet-public-1" {
    vpc_id = "${aws_vpc.Tech-start-vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "us-east-2a"

    tags = {
        Name = "Tech-start-vpc"
    }
}