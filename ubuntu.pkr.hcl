packer {
  required_plugins {
    name = {
      version = "~> 1"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

source "proxmox-iso" "ubuntu" {
  proxmox_url              = var.proxmox_url
  insecure_skip_tls_verify = var.insecure_skip_tls_verify
  username                 = var.pve_username
  token                    = var.pve_token
  node                     = var.pve_node_name

  vm_name         = var.vm_name
  os              = var.os
  cpu_type        = var.cpu_type
  cores           = var.cores
  sockets         = var.sockets
  memory          = var.memory
  scsi_controller = var.scsi_controller
  communicator    = var.communicator

  disks {
    storage_pool = var.storage_pool
    disk_size    = var.disk_size
    format       = var.format_disk
    io_thread    = var.is_io_thread
    type         = var.type_bus
  }

  network_adapters {
    model  = var.net_adapter_model
    bridge = var.net_adapter_bridge
  }

  boot_iso {
    type         = var.type_bus
    unmount      = var.is_umount_boot_iso
    iso_file     = local.iso_file
    iso_checksum = local.iso_checksum
  }

  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  ssh_timeout  = var.ssh_timeout

  boot_wait    = var.boot_wait
  http_content = local.autoinstall_files

  boot_command = [
    "e<wait>",
    "<down><down><down>",
    "<end><bs><bs><bs><bs><wait>",
    "ipv6.disable=1 \"ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/\" autoinstall ---<wait>",
    "<f10><wait>"
  ]
}

build {
  sources = ["sources.proxmox-iso.ubuntu"]
}