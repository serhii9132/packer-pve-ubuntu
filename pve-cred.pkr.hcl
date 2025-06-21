variable "proxmox_url" {
    type = string
    default = env("PROXMOX_URL")
}

variable "insecure_skip_tls_verify" {
    type = bool
    default = true
}

variable "pve_username" {
    type = string
    default = env("PROXMOX_USER")
}

variable "pve_token" {
    type = string
    default = env("PROXMOX_TOKEN")
}

variable "pve_node_name" {
    type = string
    default = env("PROXMOX_NAME_NODE")
}

variable "pve-name-datastore" {
    type = string
    default = env("PROXMOX_NAME_DATASTORE")
}

variable "ssh_username" {
  type = string
  default = env("SSH_USERNAME")
}

variable "ssh_password" {
  type = string
  default = env("SSH_PASSWORD")
}

variable "ssh_pass_encrypt" {
  type = string
  default = env("SSH_PASSWORD_ENCRYPT")
}

variable "ssh_pub_key" {
  type = string
  default = env("SSH_PUB_KEY")
}

variable "vm_hostname" {
  type = string
  default = env("VM_HOSTNAME")
}