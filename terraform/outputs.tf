output "external_ip_address_vm-name" {
  value = yandex_compute_instance.vm-name.network_interface.0.nat_ip_address
}