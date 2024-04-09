output "vpc_endpoint_sgs" {
  value = aws_security_group.this
}

output "vpc_endpoint_interface_ips" {
  value = aws_vpc_endpoint.interface_services
}

output "vpc_endpoint_interface_ips" {
  value = values(aws_vpc_endpoint.interface_services.network_interface_ids)[*].private_ip
}

output "vpc_endpoint_gateway_services" {
  value = aws_vpc_endpoint.gateway_services
}
