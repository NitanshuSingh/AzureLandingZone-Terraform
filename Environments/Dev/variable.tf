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

}

variable "nsg" {

}

variable "pip" {

}
variable "linux-vm" {

}
variable "bastion" {

}
variable "lb" {

}

variable "association" {
  
}