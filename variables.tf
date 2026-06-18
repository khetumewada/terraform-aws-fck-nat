variable "name" {
  type        = string
  description = "Name of the FCK NAT instance"
}

variable "ami"{
  type        = string
  default     = ""
  description = "AMI ID for the FCK NAT instance (if not provided, the module will search for the latest compatible AMI)"
}

variable "az_index" {
  type        = number
  description = "Index of the availability zone for the FCK NAT instance, used for naming and subnet selection"
}

variable "vpc_id" {
  type = string
}

variable "architecture" {
  type    = string
  default = "x86_64"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the FCK NAT instance"
  default     = "t4g.nano"
}

variable "public_subnet_id" {
  type        = string
  description = "Public subnet ID for the FCK NAT instance"
}

variable "vpc_cidr_block" {
  type = string
}

variable "key_name" {
  type        = string
  default     = ""
  description = "Key pair name for SSH access to the FCK NAT instance"
}

variable "create_eip" {
  type        = bool
  default     = true
  description = "Check for elastic ip create or not"
}

variable "eip_allocation_id" {
  type        = string
  description = "EIP allocation ID for the FCK NAT instance"
}

variable "sg_ingress_rules" {
  type = list(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default     = []
  description = "List of ingress rules for the security group associated with the FCK NAT instance"
}

variable "create_security_group" {
  type        = bool
  default     = true
  description = "Whether to create a security group for the FCK NAT instance."
}

variable "security_group_ids" {
  type        = list(string)
  default     = []
  description = "Existing security group IDs to attach to the FCK NAT instance when create_security_group is false."
}