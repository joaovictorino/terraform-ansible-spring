# Terraform e Ansible criando IaaS no Azure e fazendo deploy de Java e MySQL

Pré-requisitos
- Az-cli instalado
- Terraform instalado

Logar no Azure via az-cli, o navegador será aberto para que o login seja feito
````sh
az login
````

Inicializar o Terraform
````sh
terraform init
````

Executar o Terraform
````sh
terraform apply -auto-approve
````

Excluir as máquinas Ansible após execução
````sh
terraform destroy --auto-approve    --target azurerm_linux_virtual_machine.vm_aula_ansible \
                                    --target azurerm_storage_account.storage_aula_ansible \
                                    --target azurerm_network_interface.nic_aula_ansible \
                                    --target azurerm_public_ip.publicip_aula_ansible
````
