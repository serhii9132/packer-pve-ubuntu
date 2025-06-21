### Overview
Packer templates for creating Ubuntu VM images on Proxmox VE using the proxmox-iso builder.
All sensitive data is configured using environment variables. See the Usage section for details.

### Template details
- Version OS: 24.02 LTS
- CPU: 2 cores
- Disk: 50 Gb
- RAM: 4 Gb
- Partitioning: LVM
- Swap: Disabled
- Preinstalled packages: openssh-server, qemu-guest-agent
- User: with sudo privileges is created without password prompt.
- Root: Disabled

### Tested With
- Packer: v1.13.0
- Proxmox VE: 8.3.0

### Notes
The ISO image must be downloaded to the Proxmox server's datastore before deploying the template.

### Usage
1. Clone the repository.
2. Create a .env file in the root of the project with the following content:
```
# Proxmox API credentials
export PROXMOX_NAME_NODE="pve-node"
export PROXMOX_URL="https://192.168.111.111:8006/api2/json"
export PROXMOX_USER="packer@pam!packer-token"
export PROXMOX_TOKEN="aaabbbcc-dd11-ddee-1111-bbbbb1122323"
export PROXMOX_NAME_DATASTORE='local-storage'

# SSH user configuration
export SSH_USERNAME="user"
export SSH_PASSWORD="password"
export SSH_PASSWORD_ENCRYPT='$6$example$hashedpasswordhere'  # Use: mkpasswd -m sha-512
export SSH_PUB_KEY='ssh-ed25519 AAAAC3NzaC1... user@host'     # Public SSH key (RSA or ED25519)

# Host settings
export VM_HOSTNAME="vm-hostname"
```
3. Run the following commands:
```
source .env
packer build .
```