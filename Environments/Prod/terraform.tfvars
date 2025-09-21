rg = {
  rg1 = {
    rg_name     = "svc-endpoint-rg"
    rg_location = "centralindia"
  }
}

vnet = {
  vet1 = {
    vnet_name     = "svc-endpoint-vnet"
    location      = "centralindia"
    rg_name       = "svc-endpoint-rg"
    address_space = ["10.0.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    subnet_name         = "svc-endpoint-subnet"
    resource_group_name = "svc-endpoint-rg"
    vnet_name           = "svc-endpoint-vnet"
    address_prefixes    = ["10.0.0.0/24"]
    service_endpoints   = ["Microsoft.Storage"]
  }
  subnet2 = {
    subnet_name         = "AzureBastionSubnet"
    resource_group_name = "svc-endpoint-rg"
    vnet_name           = "svc-endpoint-vnet"
    address_prefixes    = ["10.0.1.0/24"]
  }
}

nsg = {
  nsg1 = {
    nsg_name            = "nsg1"
    location            = "centralindia"
    resource_group_name = "svc-endpoint-rg"
    security_rule = {
      rule1 = {
        name                   = "allow"
        priority               = 100
        direction              = "Inbound"
        access                 = "Allow"
        source_port_range      = "*"
        protocol               = "Tcp"
        destination_port_range = "*"
      }
    }
  }
}

pip = {
  pip1 = {
    pip_name            = "test-pip"
    location            = "centralindia"
    resource_group_name = "svc-endpoint-rg"
  }
}

# linux-vm = {
#   vm1 = {
#     nic_name            = "nic1"
#     location            = "centralindia"
#     resource_group_name = "svc-endpoint-rg"
#     subnet_name         = "svc-endpoint-subnet"
#     vnet_name           = "svc-endpoint-vnet"
#     nsg_name            = "nsg1"
#     vm-name             = "frontend-vm"
#     size                = "Standard_F2"
#     password            = "Password@123"
#   }
# }

bastion = {
  bastion1 = {
    bastion_name        = "svc-endpoint-bastion"
    location            = "centralindia"
    resource_group_name = "svc-endpoint-rg"
    pip_name            = "test-pip"
    subnet_name         = "AzureBastionSubnet"
    vnet_name           = "svc-endpoint-vnet"
  }
}

strg = {
  strg1 = {
    storage_account_name = "svcendpointstrg"
    resource_group_name  = "svc-endpoint-rg"
    location             = "centralindia"
    vnet_name            = "svc-endpoint-vnet"
    subnet_name          = "svc-endpoint-subnet"
  }
}

blob = {
  strg1 = {
    blob_name = "svc-endpoint-container"
  }
}

win-vm = {
  vm1 = {
    nic_name            = "nic1"
    location            = "centralindia"
    resource_group_name = "svc-endpoint-rg"
    subnet_name         = "svc-endpoint-subnet"
    vnet_name           = "svc-endpoint-vnet"
    nsg_name            = "nsg1"
    vm-name             = "sv-ep-win-vm"
    password            = "Password@123"
  }
}