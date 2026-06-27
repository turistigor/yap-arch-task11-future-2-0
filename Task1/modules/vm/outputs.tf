output "disk_creation_time" {
    value = yandex_compute_disk.test_disk.created_at
}

output "disk_id" {
    value = yandex_compute_disk.test_disk.id
}


output "vm_hostname" {
    value = yandex_compute_instance.test_vm.hostname
}

output "vm_creation_time" {
    value = yandex_compute_instance.test_vm.created_at
}

output "vm_disk_id" {
    value = yandex_compute_instance.test_vm.boot_disk[0].disk_id
}

output "vm_disk_device_name" {
    value = yandex_compute_instance.test_vm.boot_disk[0].device_name
}

output "vm_ip" {
    value = yandex_compute_instance.test_vm.network_interface[0].ip_address
}
