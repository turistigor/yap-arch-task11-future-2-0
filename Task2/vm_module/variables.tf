variable "yc_token" {
    type = string
    description = "Yandex cloud token (env TF_VAR_yc_token)"
}

variable "cloud_id" {
    type = string
    description = "Cloud identifier (env TF_VAR_cloud_id)"
}

variable "folder_id" {
    type = string
    description = "Cloud folder identifier (env TF_VAR_folder_id)"
}

variable "subnet_id" {
    type = string
    description = "Cloud subnet identifier (env TF_VAR_subnet_id)"
}


variable "yac_zone" {
    type = string
    description = "Cloud zone"
    default = "ru-central1-d"
}

variable "yac_platform_id" {
    type = string
    description = "Cloud virtual machine platform identifier"
    default = "standard-v3"
}

variable "yac_os_family" {
    type = string
    description = "Cloud virtual machine OS family"
    default = "ubuntu-2204-lts"
}

variable "yac_disk_type" {
    type = string
    description = "Cloud virtual machine disk type"
    default = "network-ssd"
}

variable "vm_name" {
    type = string
    description = "Virtual machine name"
    default = "test-vm"
}

variable "vm_disk_size" {
    type = number
    description = "Virtual machine disk size in Gb"
}

variable "vm_cpu_cores" {
    type = number
    description = "Virtual machine CPU cores count"
}

variable "vm_ram" {
    type = number
    description = "Virtual machine RAM in Gb"
}

variable "vm_nat_enabled" {
    type = bool
    description = "Virtual machine NAT state (true/false)"
    default = true
}
