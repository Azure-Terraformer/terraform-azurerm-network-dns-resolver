variable "name" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
}
variable "virtual_network" {
  type = object({
    id   = string
    name = string
  })
}
variable "inbound_subnet_name" {
  type    = string
  default = "snet-dns-resolver-inbound"
}
variable "outbound_subnet_name" {
  type    = string
  default = "snet-dns-resolver-outbound"
}
variable "inbound_address_space" {
  type = string
}
variable "outbound_address_space" {
  type = string
}
