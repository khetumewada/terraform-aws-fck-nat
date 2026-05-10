resource "aws_security_group" "fck_nat_sg" {
  count       = var.create_security_group ? 1 : 0
  name        = "${var.name}-sg"
  description = "Security Group for FCK NAT Instance"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.sg_ingress_rules
    content {
      protocol    = ingress.value.protocol
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}