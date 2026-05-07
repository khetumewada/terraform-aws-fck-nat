# FCK NAT Terraform Module

## Features
- Creates NAT EC2 instance
- Creates Security Group
- Optional EIP creation
- Supports external EIP

## Usage
if you want to create a new EIP for NAT instance inside the module.

      module "fck_nat" {
      source = "git::https://github.com/khetumewada/terraform-aws-fck-nat.git?ref=v1.0.0"
        
      for_each = var.environment != "prod" ? {
        for index in range(var.az_count) : index => index
        } : {}

      az_index         = each.value
      name              = "fck-nat"
      vpc_id            = "vpc-xxxx"
      public_subnet_id  = "subnet-xxxx"
      key_name          = "my-key"
      architecture      = "amd64" or "x86_64"
      instance_type     = "xxx" ex-"t4g.nano"

      create_eip        = true
    
      sg_ingress_rules = [
        {
          port        = 22
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }

### Usage
if you want to pass the existing EIP allocation id to the NAT instance

      module "fck_nat" {
      source = "https://github.com/khetumewada/terraform-aws-fck-nat?ref=v1.0.0"
    
      for_each = var.environment != "prod" ? {
        for index in range(var.az_count) : index => index
        } : {}

      az_index         = each.value
      name              = "fck-nat"
      vpc_id            = "vpc-xxxx"
      public_subnet_id  = "subnet-xxxx"
      key_name          = "my-key"
      architecture      = "amd64" or "x86_64"
      instance_type     = "xxx" ex-"t4g.nano"

      create_eip        = false
      eip_allocation_id = "eipalloc-xxxx"

      sg_ingress_rules = [
        {
          port        = 22
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }