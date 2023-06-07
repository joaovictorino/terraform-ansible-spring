output "public_ip_address" {
  value = "http://${azurerm_public_ip.publicip_aula.ip_address}:8080"
}
