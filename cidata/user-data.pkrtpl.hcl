#cloud-config
autoinstall:
  version: 1

  source:
    search_drivers: false
    id: ubuntu-server-minimal

  storage:
    swap:
      size: 0
    layout:
      name: lvm

  ssh:
    install-server: true
    allow-pw: true

  packages:
    - qemu-guest-agent

  timezone: "UTC"

  updates: all
    
  late-commands:
    - lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
    - resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
    - echo "${var.ssh_username} ALL=(ALL:ALL) NOPASSWD:ALL" > /target/etc/sudoers.d/${var.ssh_username}

  user-data:
    hostname: ${var.vm_hostname}
    users:
      - name: ${var.ssh_username}
        passwd: ${var.ssh_pass_encrypt}
        shell: /bin/bash
        lock_passwd: False
        groups: sudo
        ssh_authorized_keys:
         - ${var.ssh_pub_key}