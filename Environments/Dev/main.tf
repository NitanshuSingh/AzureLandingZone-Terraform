module "my-rg" {
  source = "../../Modules/azurerm_resource_group"
  rg     = var.rg
}

module "vnet" {
  depends_on = [module.my-rg]
  source     = "../../Modules/azurerm_virtual_network"
  vnet       = var.vnet
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../Modules/azurerm_subnet"
  subnet     = var.subnet
}

module "nsg" {
  depends_on = [module.my-rg]
  source     = "../../Modules/azurerm_network_security_group"
  nsg        = var.nsg
}

module "pip" {
  depends_on = [module.my-rg]
  source     = "../../Modules/azurerm_public_ip"
  pip        = var.pip
}
module "linux-vm" {
  depends_on = [module.my-rg, module.nsg, module.subnet ]
  source     = "../../Modules/azurerm_linux_vm"
  linux-vm   = var.linux-vm
}

module "bastion" {
  depends_on = [ module.my-rg,module.pip,module.subnet ]
  source = "../../Modules/azurerm_bastion_host"
  bastion = var.bastion
}

module "load-balancer" {
  depends_on = [ module.my-rg,module.pip, module.linux-vm ]
  source = "../../Modules/azurerm_load_balancer"
  lb = var.lb
  }

module "lb-nic-association" {
  depends_on = [ module.load-balancer, module.linux-vm ]
  source = "../../Modules/azurerm_lb_pool_nic_association"
  association = var.association
}
 