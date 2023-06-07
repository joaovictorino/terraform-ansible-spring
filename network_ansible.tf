resource "azurerm_network_interface" "nic_aula_ansible" {
  name                = "myNICAnsible"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_aula.name

  ip_configuration {
    name                          = "myNicConfigurationAnsible"
    subnet_id                     = azurerm_subnet.subnet_aula.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip_aula_ansible.id
  }

  tags = {
    environment = "aula infra",
    tool        = "ansible"
  }

  depends_on = [azurerm_resource_group.rg_aula,
    azurerm_subnet.subnet_aula,
  azurerm_public_ip.publicip_aula_ansible]
}

resource "azurerm_public_ip" "publicip_aula_ansible" {
  name                    = "myPublicIPAnsible"
  location                = var.location
  resource_group_name     = azurerm_resource_group.rg_aula.name
  allocation_method       = "Static"
  idle_timeout_in_minutes = 30

  tags = {
    environment = "aula infra",
    tool        = "ansible"
  }

  depends_on = [azurerm_resource_group.rg_aula]
}

resource "azurerm_network_interface_security_group_association" "nicsq_aula_ansible" {
  network_interface_id      = azurerm_network_interface.nic_aula_ansible.id
  network_security_group_id = azurerm_network_security_group.sg_aula.id

  depends_on = [azurerm_network_interface.nic_aula_ansible,
  azurerm_network_security_group.sg_aula]
}