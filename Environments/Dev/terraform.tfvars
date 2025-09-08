rg = {
  rg1 = {
    rg_name     = "app-rg"
    rg_location = "centralindia"
  }
}

vnet = {
  vet1 = {
    vnet_name     = "app-vnet"
    location      = "centralindia"
    rg_name       = "app-rg"
    address_space = ["10.0.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    subnet_name         = "frontend-subnet"
    resource_group_name = "app-rg"
    vnet_name           = "app-vnet"
    address_prefixes    = ["10.0.0.0/24"]
  }
  subnet2 = {
    subnet_name         = "backend-subnet"
    resource_group_name = "app-rg"
    vnet_name           = "app-vnet"
    address_prefixes    = ["10.0.1.0/24"]
  }
  subnet3 = {
    subnet_name         = "AzureBastionSubnet"
    resource_group_name = "app-rg"
    vnet_name           = "app-vnet"
    address_prefixes    = ["10.0.2.0/24"]
  }
}

nsg = {
  nsg1 = {
    nsg_name            = "nsg1"
    location            = "centralindia"
    resource_group_name = "app-rg"
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
  nsg2 = {
    nsg_name            = "nsg2"
    location            = "centralindia"
    resource_group_name = "app-rg"
    security_rule = {
      rule1 = {
        name                   = "allowFromVnetOnly"
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
    resource_group_name = "app-rg"
  }
  pip2 = {
    pip_name            = "frontend-pip"
    location            = "centralindia"
    resource_group_name = "app-rg"
  }
}

linux-vm = {
  vm1 = {
    nic_name            = "nic1"
    location            = "centralindia"
    resource_group_name = "app-rg"
    subnet_name         = "frontend-subnet"
    vnet_name           = "app-vnet"
    nsg_name            = "nsg1"
    vm-name             = "frontend-vm"
    size                = "Standard_F2"
    password            = "Password@123"
  }
  vm2 = {
    nic_name            = "nic2"
    location            = "centralindia"
    resource_group_name = "app-rg"
    subnet_name         = "backend-subnet"
    vnet_name           = "app-vnet"
    nsg_name            = "nsg2"
    vm-name             = "backend-vm"
    size                = "Standard_F2"
    password            = "KoiP@$$w0rdNiHai"
  }
}

bastion = {
  bastion1 = {
    bastion_name        = "app-bastion"
    location            = "centralindia"
    resource_group_name = "app-rg"
    pip_name            = "test-pip"
    subnet_name         = "AzureBastionSubnet"
    vnet_name           = "app-vnet"
  }
}

lb = {
  lb1 = {
    lb_name             = "app-lb"
    location            = "centralindia"
    resource_group_name = "app-rg"
    frontend_ip_name    = "frontend-ip"
    pip_name            = "frontend-pip"
    lb_pool_name        = "app-backend-pool"
    lb_probe_name       = "app-lb-probe"
    lb_rule_name        = "app-lb-rule"
  }
}

association = {
  assoc1 = {
    lb_name             = "app-lb"
    lb_pool_name        = "app-backend-pool"
    nic_name            = "nic1"
    resource_group_name = "app-rg"
  }
  assoc2 = {
    lb_name             = "app-lb"
    lb_pool_name        = "app-backend-pool"
    nic_name            = "nic2"
    resource_group_name = "app-rg"
  }
}
