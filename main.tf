data "aws_ami" "fck_nat_ami" {
  most_recent = true
  owners = ["568608671756"]
  filter {
    name   = "name"
    values = ["fck-nat-al2023-*"]
  }
  filter {
    name   = "architecture"
    values = [var.architecture]
  }
}

resource "aws_eip" "elastic_ip" {
  count = var.create_eip ? 1 : 0
  tags = {
    Name = "elastic-ip-${var.name}"
  }
}

resource "aws_eip_association" "fck_nat_eip_asso"{
  allocation_id = var.create_eip ? aws_eip.elastic_ip[0].id : var.eip_allocation_id
  instance_id   = aws_instance.fck_nat_instance.id
  depends_on = [
    aws_instance.fck_nat_instance
   ]
}

resource "aws_instance" "fck_nat_instance" {
  ami           = data.aws_ami.fck_nat_ami.id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name != "" ? var.key_name : null

  vpc_security_group_ids = [aws_security_group.fck_nat_sg.id]

  source_dest_check = false

  tags = {
    Name = var.name
  }
}
