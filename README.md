# FCK NAT Terraform Module

Terraform module for creating a FCK NAT EC2 instance on AWS.

---

## Features

- Creates a FCK NAT EC2 instance with `source_dest_check` disabled
- Automatically finds the latest FCK NAT AMI
- Optional Elastic IP creation or attachment of an existing EIP
- Optionally creates a security group inside the module
- Supports passing existing security group IDs from outside the module
- Supports custom ingress rules when creating the security group inside the module
- Outputs public IP, ENI ID, EC2 instance ID, and created security group ID

---

## Elastic IP Usage

The module supports two EIP strategies:

| Variable | Behavior |
|---|---|
| `create_eip = true` | Allocates and associates a new Elastic IP |
| `create_eip = false` | Associates an existing Elastic IP using `eip_allocation_id` |

### When `create_eip = true`

Resources created:

| Resource | Count |
|---|---|
| EC2 Instance | 1 |
| Elastic IP | 1 |
| EIP Association | 1 |

### When `create_eip = false`

Resources created:

| Resource | Count |
|---|---|
| EC2 Instance | 1 |
| EIP Association | 1 |

> **Note:** `eip_allocation_id` is required when `create_eip = false`.

---

## Security Group Usage

The module supports two security group options:

| Variable | Behavior |
|---|---|
| `create_security_group = true` | Creates a security group inside the module |
| `create_security_group = false` | Uses existing security group IDs passed with `security_group_ids` |

### Create Security Group Inside Module

When `create_security_group = true`, the module creates a security group and attaches it to the FCK NAT instance.

Ingress rules can be passed using `sg_ingress_rules`.
