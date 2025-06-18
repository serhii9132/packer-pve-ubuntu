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
  username                 = var.pve-username
  token                    = var.pve-token
  node                     = var.pve-name-node

  os              = var.os
  cpu_type        = var.cpu_type
  cores           = var.cores
  sockets         = var.sockets
  memory          = var.memory
  scsi_controller = "virtio-scsi-single"
  communicator    = var.communicator

  boot_iso {
    type = "scsi"
    iso_file = "storage:iso/ubuntu-24.04.2-live-server-amd64.iso"
    iso_checksum = "file:https://releases.ubuntu.com/noble/SHA256SUMS"
  }

  network_adapters {
    model = "virtio"
    bridge = "vmbr0"
  }

  disks {
    storage_pool = var.storage_pool
    disk_size    = var.disk_size
    format       = var.format_disk
    io_thread    = true
    type         = "scsi"
  }

  vm_name         = var.vm_name

  ssh_username    = var.ssh_username
  ssh_password    = var.ssh_password
  ssh_timeout     = var.ssh_timeout

  boot_wait       = var.boot_wait
  http_directory  = var.http_directory

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