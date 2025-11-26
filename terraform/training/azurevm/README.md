# Azure Ubuntu VM Terraform Configuration

This Terraform configuration creates an Azure Virtual Machine running Ubuntu 22.04 LTS.

## Prerequisites

1. Azure CLI installed and authenticated (`az login`)
2. Terraform installed
3. SSH key pair generated (`ssh-keygen -t rsa -b 4096`)

## Resources Created

- Resource Group
- Virtual Network with subnet
- Public IP address
- Network Security Group (allows SSH on port 22)
- Network Interface
- Linux Virtual Machine (Ubuntu 22.04 LTS)

## Usage

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Create a terraform.tfvars file (optional):**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your desired values
   ```

3. **Review the execution plan:**
   ```bash
   terraform plan
   ```

4. **Apply the configuration:**
   ```bash
   terraform apply
   ```

5. **Connect to the VM:**
   After the deployment completes, use the SSH connection string from the output:
   ```bash
   ssh azureuser@<public_ip_address>
   ```

## Clean Up

To destroy all resources:
```bash
terraform destroy
```

## Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `resource_group_name` | Name of the resource group | `rg-ubuntu-vm` |
| `location` | Azure region | `East US` |
| `prefix` | Prefix for resource names | `ubuntu` |
| `vm_size` | VM size | `Standard_B2s` |
| `admin_username` | Admin username | `azureuser` |
| `ssh_public_key_path` | Path to SSH public key | `~/.ssh/id_rsa.pub` |

## Outputs

- `resource_group_name`: Name of the created resource group
- `vm_name`: Name of the virtual machine
- `public_ip_address`: Public IP address of the VM
- `ssh_connection_string`: Command to SSH into the VM
