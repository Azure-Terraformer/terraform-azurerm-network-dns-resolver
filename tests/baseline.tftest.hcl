provider "azurerm" {
  features {}
  subscription_id = "b2dcbc85-4327-454d-8972-b8ab7fcf5e76"
}

variables {
  name_prefix = "aztf-test"
  location    = "eastus2"
}

run "baseline" {
  module {
    source = "./examples/baseline"
  }

  providers = {
    azurerm = azurerm
  }
}
