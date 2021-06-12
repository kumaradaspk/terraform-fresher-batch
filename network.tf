# Internet Gateway
resource "aws_internet_gateway" "Tech-start-igw" {
    vpc_id = "${aws_vpc.Tech-start-vpc.id}"

    tags =  {
        Name = "Tech-start-igw"
    }
}

# Route Teable
resource "aws_route_table" "Tech-start-public-rt" {
    vpc_id = "${aws_vpc.Tech-start-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = "${aws_internet_gateway.Tech-start-igw.id}" 
    }

    tags = {
        Name = "Tech-start-public-rt"
    }
}

# route table association for the public subnets
resource "aws_route_table_association" "Tech-start-rta-public-subnet-1" {
    subnet_id = "${aws_subnet.Tech-start-subnet-public-1.id}"
    route_table_id = "${aws_route_table.Tech-start-public-rt.id}"
}

# security group
resource "aws_security_group" "ssh-allowed" {

    vpc_id = "${aws_vpc.Tech-start-vpc.id}"

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags =  {
        Name = "ssh-allowed"
    }
}