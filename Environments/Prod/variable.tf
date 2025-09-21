variable "rg" {
  description = "Resource Group name"
  type = map(object({
    rg_name     = string
    rg_location = string
  }))
}

variable "vnet" {

}

variable "subnet" {
  description = "Storage account values"
  type = map(object({
    subnet_name         = string
    resource_group_name = string
    vnet_name           = string
    address_prefixes    = list(string)
    service_endpoints   = optional(list(string))
  }))
}

variable "nsg" {

}

variable "pip" {

}
# variable "linux-vm" {

# }
variable "bastion" {

}

variable "strg" {

}
variable "blob" {

}

variable "win-vm" {

}