resource "aws_eip" "this" {
  domain = true

  tags = {
    Name: "${var.env}-eip"
  }
}

resource "aws_nat_gateway" "this" {
    allocaation_id = aws_eip.this.id
    subnet_id = aws_subnet.public[0].id
    
    tags = {
        Name: "${var.env}-nat-gw"
    }

    depends_on = [ aws_internet_gateway.this ]
}