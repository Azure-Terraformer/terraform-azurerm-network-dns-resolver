# minimum subnet size of /28
# https://learn.microsoft.com/en-us/azure/dns/dns-private-resolver-overview
resource "azurerm_subnet" "inbound" {
  name                            = var.inbound_subnet_name
  resource_group_name             = var.resource_group_name
  virtual_network_name            = var.virtual_network.name
  address_prefixes                = [var.inbound_address_space]
  default_outbound_access_enabled = false

  delegation {
    name = "Microsoft.Network.dnsResolvers"
    service_delegation {
      name    = "Microsoft.Network/dnsResolvers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

resource "azurerm_subnet" "outbound" {
  name                            = var.outbound_subnet_name
  resource_group_name             = var.resource_group_name
  virtual_network_name            = var.virtual_network.name
  address_prefixes                = [var.outbound_address_space]
  default_outbound_access_enabled = false

  delegation {
    name = "Microsoft.Network.dnsResolvers"
    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}
