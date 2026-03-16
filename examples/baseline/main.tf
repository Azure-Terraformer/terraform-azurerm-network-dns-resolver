module "setup" {
  source = "../../testing/setup"

  name_prefix   = var.name_prefix
  location      = var.location
  address_space = var.dns_address_space

}

locals {
  inbound_subnet_address_space  = cidrsubnet(var.dns_address_space, 4, 0)
  outbound_subnet_address_space = cidrsubnet(var.dns_address_space, 4, 1)
}

module "resolver" {

  # points to the module under test (repo root)
  source = "../../"

  resource_group_name    = module.setup.resource_group_name
  location               = module.setup.location
  name                   = var.name_prefix
  virtual_network        = module.setup.virtual_network
  inbound_address_space  = local.inbound_subnet_address_space
  outbound_address_space = local.outbound_subnet_address_space

}
