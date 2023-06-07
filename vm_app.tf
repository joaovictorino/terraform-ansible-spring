resource "azurerm_linux_virtual_machine" "vm_aula" {
  name                  = "myVM"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg_aula.name
  network_interface_ids = [azurerm_network_interface.nic_aula.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "myvm"
  admin_username                  = var.user
  admin_password                  = var.password
  disable_password_authentication = false

  tags = {
    environment = "aula infra"
  }

  depends_on = [azurerm_resource_group.rg_aula,
    azurerm_network_interface.nic_aula,
  azurerm_public_ip.publicip_aula]
}
