variable "rg" {
  default     = {
    default = {
      rg_name     = "default-rg"
      rg_location = "eastus"
    }
  }
  description = "Resource Group name"
  type        = map(object({
    rg_name     = string
    rg_location = string
  }))
}