resource "azurerm_network_interface" "nic_aula" {
    name                      = "myNIC"
    location                  = var.location
    resource_group_name       = azurerm_resource_group.rg_aula.name

    ip_configuration {
        name                          = "myNicConfiguration"
        subnet_id                     = azurerm_subnet.subnet_aula.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.publicip_aula.id
    }

    tags = {
        environment = "aula infra"
    }

    depends_on = [  azurerm_resource_group.rg_aula, 
                    azurerm_subnet.subnet_aula, 
                    azurerm_public_ip.publicip_aula ]
}

resource "azurerm_public_ip" "publicip_aula" {
    name                         = "myPublicIP"
    location                     = var.location
    resource_group_name          = azurerm_resource_group.rg_aula.name
    allocation_method            = "Static"
    idle_timeout_in_minutes = 30

    tags = {
        environment = "aula infra"
    }

    depends_on = [ azurerm_resource_group.rg_aula ]
}

resource "azurerm_network_interface_security_group_association" "nicsq_aula" {
    network_interface_id      = azurerm_network_interface.nic_aula.id
    network_security_group_id = azurerm_network_security_group.sg_aula.id

    depends_on = [  azurerm_network_interface.nic_aula, 
                    azurerm_network_security_group.sg_aula ]
}