variable "timezone" {
  description = "Timezone setting for all VMs "
  default     = "America/Sao_Paulo"
}

variable "ssh_key_path" {
  description = "path of pub ssh key"
  default     = "~/.ssh/id_rsa.pub"
}

variable "name_prefix" {
  description = "a prefix for all names of objects to avoid collision. Eg. moio-"
  default     = ""
}

variable "use_shared_resources" {
  description = "use true to avoid deploying images, mirrors and other shared infrastructure resources"
  default     = false
}

// Provider-specific variables

variable "pool" {
  description = "libvirt storage pooll name for VM disks"
  default     = "Vms"
}

variable "network_name" {
  description = "libvirt NAT networks name for VMs, use empty string for bridged netwroking"
  default     = "vnet01"
}

variable "bridge" {
  description = "a bridge device name available on the libvirt host, leave default for NAT"
  default     = ""
}

variable "images" {
  description = "list of images to be uploaded to the libvirt host, leave default for all"
  default     = ["centos7", "ubuntu"]
  type        = "list"
}
