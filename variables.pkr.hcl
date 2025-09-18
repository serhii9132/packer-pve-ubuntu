locals {
  iso_checksum = "file:https://releases.ubuntu.com/noble/SHA256SUMS"
  name_iso_file = "ubuntu-24.04.3-live-server-amd64.iso"
  iso_url = "https://releases.ubuntu.com/noble/${local.name_iso_file}"
    
  autoinstall_files = {
    "/meta-data" = file(abspath("${path.root}/cidata/meta-data"))
    "/user-data" = templatefile(abspath("${path.root}/cidata/user-data.pkrtpl.hcl"), { var = var })
  }
}

variable "task_timeout" {
  type    = string
  default = "15m"
}

variable "vm_name" {
  type    = string
  default = "ubuntu-24.04-lts"
}

variable "os" {
  type    = string
  default = "l26"
}

variable "cpu_type" {
  type    = string
  default = "kvm64"
}

variable "cores" {
  type    = number
  default = 2
}

variable "sockets" {
  type    = number
  default = 1
}

variable "memory" {
  type    = number
  default = 4096
}

variable "scsi_controller" {
  type    = string
  default = "virtio-scsi-single"
}

variable "communicator" {
  type    = string
  default = "ssh"
}

variable "type_bus" {
  type    = string
  default = "scsi"
}

variable "is_umount_iso" {
  type    = bool
  default = true
}

variable "iso_download_pve" {
  type    = bool
  default = true
}

variable "disk_size" {
  type    = string
  default = "50G"
}

variable "format_disk" {
  type    = string
  default = "qcow2"
}

variable "is_io_thread" {
  type    = bool
  default = true
}

variable "net_adapter_model" {
  type    = string
  default = "virtio"
}

variable "net_adapter_bridge" {
  type    = string
  default = "vmbr0"
}

variable "ssh_timeout" {
  type    = string
  default = "30m"
}

variable "boot_wait" {
  type    = string
  default = "10s"
}

variable "cd_label" {
  type    = string
  default = "cidata"
}