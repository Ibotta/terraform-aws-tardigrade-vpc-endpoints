output "vpc_endpoint_sgs" {
  value = aws_security_group.this
}

output "vpc_endpoint_interface_services" {
  # value = aws_vpc_endpoint.interface_services
  value = {
    for int_serv in aws_vpc_endpoint.interface_services : int_serv.id => {
      id                    = int_serv.id
      service_name          = int_serv.service_name
      vpc_id                = int_serv.vpc_id
      private_dns_enabled   = int_serv.private_dns_enabled
      security_group_ids    = int_serv.security_group_ids
      subnet_ids            = int_serv.subnet_ids
      network_interface_ids = int_serv.network_interface_ids
      dns_entry             = int_serv.dns_entry
      state                 = int_serv.state
    }
  }
}

output "vpc_endpoint_gateway_services" {
  value = aws_vpc_endpoint.gateway_services
}
