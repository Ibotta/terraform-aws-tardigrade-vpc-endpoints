variable "create_sg_per_endpoint" {
  description = "Toggle to create a SecurityGroup for each VPC Endpoint. Defaults to using just one for all Interface Endpoints. Note that Gateway Endpoints don't support SecurityGroups."
  type        = bool
  default     = false
}

variable "create_vpc_endpoints" {
  description = "Toggle to create VPC Endpoints."
  type        = bool
  default     = true
}

variable "sg_egress_rules" {
  description = "Egress rules for the VPC Endpoint SecurityGroup(s). Set to empty list to disable default rules."
  type = list(object({
    description      = string
    prefix_list_ids  = list(string)
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    security_groups  = list(string)
  }))
  default = [{
    description      = null
    prefix_list_ids  = null
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = null
    security_groups  = null
  }]
}

variable "sg_ingress_rules" {
  description = "Ingress rules for the VPC Endpoint SecurityGroup(s). Set to empty list to disable default rules."
  type = list(object({
    description      = string
    prefix_list_ids  = list(string)
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    security_groups  = list(string)
  }))
  default = [{
    description      = null
    prefix_list_ids  = null
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = null
    security_groups  = null
  }]
}

variable "subnet_ids" {
  type        = list(string)
  description = "Target Subnet ids."
  default     = []
}

variable "vpc_endpoint_services" {
  type = object({
    interface = list(string)
    gateway   = list(string)
  })

  description = "List of VPC Endpoint services separated by type: interface and gateway"

  default = {
    interface = []
    gateway   = []
  }
}

variable "tags" {
  description = "A map of tags to add to the VPC Endpoint and to the SecurityGroup(s)."
  type        = map(string)
  default     = {}
}
