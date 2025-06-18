variable "cpu_type" {
  type = string
  default = "kvm64"
}

variable "cores" {
  type = number
  default = 2
}

variable "sockets" {
  type = number
  default = 1
}

variable "memory" {
  type = number
  default = 4096
}

variable "disk_size" {
  type = string
  default = "50G"
}

variable "storage_pool" {
  type = string
  default = "storage"
}

variable "format_disk" {
  type = string
  default = "qcow2"
}

variable "vm_name" {
  type = string
  default = "ubuntu-22.04.2-lts"
}

variable "communicator" {
  type = string
  default = "ssh"
}

variable "os" {
  type = string
  default = "l26"
}

# variable "iso_file" {
#   type = string
# }

# variable "iso_url" {
#   type = string
# }

# variable "iso_checksum" {
#   type = string
# }

# variable "iso_source" {
#   type = string
# }

variable "ssh_username" {
  type = string
  default = env("SSH_USER")
}

variable "ssh_password" {
  type = string
  default = env("SSH_PASSWORD")
}

# variable "ssh_pub_key" {
#   type = string
#   default = env("SSH_PUB_KEY")
# }

# variable "ssh_pass_encrypt" {
#   type = string
#   default = env("SSH_PASSWORD_ENCRYPT")
# }

variable "ssh_timeout" {
  type = string
  default = "30m"
}

variable "http_directory" {
  type = string
  default = "http"
}

variable "boot_wait" {
  type = string
  default = "10s"
}