resource "azurerm_network_interface" "nic_aula_db" {
    name                      = "myNICDB"
    location                  = var.location
    resource_group_name       = azurerm_resource_group.rg_aula.name

    ip_configuration {
        name                          = "myNicConfigurationDB"
        subnet_id                     = azurerm_subnet.subnet_aula.id
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.80.4.10"
    }

    tags = {
        environment = "aula infra"
    }

    depends_on = [  azurerm_resource_group.rg_aula, 
                    azurerm_subnet.subnet_aula ]
}

resource "azurerm_network_interface_security_group_association" "nicsq_aula_db" {
    network_interface_id      = azurerm_network_interface.nic_aula_db.id
    network_security_group_id = azurerm_network_security_group.sg_aula.id

    depends_on = [  azurerm_network_interface.nic_aula_db, 
                    azurerm_network_security_group.sg_aula ]
}