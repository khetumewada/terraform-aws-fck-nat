# Public ip of instance
output "public_ip" {
  value = var.create_eip ? aws_eip.elastic_ip[0].public_ip : null
}

# Output the ENI ID of the NAT instance
output "eni_id" {
  value = aws_instance.fck_nat_instance.primary_network_interface_id
}

# FCK NAT instance outputs
output "fck_nat_instance_id" {
  value = aws_instance.fck_nat_instance.id
}