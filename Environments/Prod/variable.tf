variable "rg" {
    type = map(any)
}

variable "strg" {
  type = map(any)
  description = "Storage Account for backend"
}

variable "blob" {
  type = map(any)
}