packer {
  required_plugins {
    name = {
      version = "~> 1"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

source "proxmox-iso" "ubuntu" {
  proxmox_url               = var.proxmox_url
  insecure_skip_tls_verify  = var.insecure_skip_tls_verify
  username                  = var.pve_username
  token                     = var.pve_token
  node                      = var.pve_node_name
  task_timeout              = var.task_timeout

  vm_name                   = var.vm_name
  os                        = var.os
  cpu_type                  = var.cpu_type
  cores                     = var.cores
  sockets                   = var.sockets
  memory                    = var.memory
  scsi_controller           = var.scsi_controller
  communicator              = var.communicator

  disks {
    storage_pool            = var.pve-name-datastore
    disk_size               = var.disk_size
    format                  = var.format_disk
    io_thread               = var.is_io_thread
    type                    = var.type_bus
  }

  network_adapters {
    model                   = var.net_adapter_model
    bridge                  = var.net_adapter_bridge
  }

  boot_iso {
    type                    = var.type_bus
    unmount                 = var.is_umount_iso
    iso_download_pve        = var.iso_download_pve
    iso_storage_pool        = var.pve-name-datastore
    iso_url                 = local.iso_url
    iso_checksum            = local.iso_checksum
  }

  additional_iso_files { 
    type                    = var.type_bus
    cd_content              = local.autoinstall_files
    cd_label                = var.cd_label
    iso_storage_pool        = var.pve-name-datastore
    unmount                 = var.is_umount_iso
  }

  ssh_username              = var.ssh_username
  ssh_password              = var.ssh_password
  ssh_timeout               = var.ssh_timeout

  boot_wait                 = var.boot_wait
  boot_command = [
    "e<wait>",
    "<down><down><down>",
    "<end><bs><bs><bs><bs><wait>",
    "ipv6.disable=1 <wait5s> autoinstall ---<wait>",
    "<f10><wait>"
  ]
}

build {
  sources = ["sources.proxmox-iso.ubuntu"]
}