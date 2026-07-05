module vm {
  source = "../../modules/vm"

  yac_cloud_id = var.yac_cloud_id
  yac_folder_id = var.yac_folder_id
  yac_subnet_id = var.yac_subnet_id

  yac_zone = var.yac_zone
  yac_disk_type = var.yac_disk_type
  yac_platform_id = var.yac_platform_id
  yac_os_family = var.yac_os_family

  vm_name = var.vm_name
  vm_disk_size = var.vm_disk_size
  vm_cpu_cores = var.vm_cpu_cores
  vm_ram = var.vm_ram
  vm_nat_enabled = var.vm_nat_enabled

  ssh_key = var.ssh_key
}