terraform init -upgrade

terraform state rm null_resource.deploy

terraform destroy --auto-approve    --target azurerm_linux_virtual_machine.vm_aula_ansible \
                                    --target azurerm_storage_account.storage_aula_ansible \
                                    --target azurerm_network_interface.nic_aula_ansible \
                                    --target azurerm_public_ip.publicip_aula_ansible
