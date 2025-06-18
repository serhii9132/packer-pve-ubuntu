variable "proxmox_url" {
    type = string
    default = env("PROXMOX_URL")
}

variable "insecure_skip_tls_verify" {
    type = bool
    default = true
}

variable "pve-username" {
    type = string
    default = env("PROXMOX_USER")
}

variable "pve-token" {
    type = string
    default = env("PROXMOX_TOKEN")
}