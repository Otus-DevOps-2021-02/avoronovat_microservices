output "external_ip_address_app" {
  value = yandex_compute_instance.app.*.network_interface.0.nat_ip_address
}


resource "local_file" "AnsibleInventoryJSON" {
  content = templatefile("inventory.json.tmpl",
    {
      app-ip = yandex_compute_instance.app.*.network_interface.0.nat_ip_address
    }
  )
  filename = "../ansible/inventory.json"
}
