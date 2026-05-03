provider "azurerm" {
  features {}
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "devops-vm"
  resource_group_name = "your-rg-name"
  location            = "Central India"
  size                = "Standard_B1s"

  admin_username = "azureuser"

  network_interface_ids = [
    "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/<RG_NAME>/providers/Microsoft.Network/networkInterfaces/<NIC_NAME>"
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
