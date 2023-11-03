locals {
  tags_ip = {
    "tf-name" = var.name
    "tf-ip"   = "public"
  }
}

data "azurerm_resource_group" "get_resource_group" {
  name = var.resource_group_name
}

resource "azurerm_public_ip" "create_public_ip" {
  name                    = var.name
  resource_group_name     = data.azurerm_resource_group.get_resource_group.name
  location                = data.azurerm_resource_group.get_resource_group.location
  allocation_method       = var.allocation_method
  sku                     = var.sku
  zones                   = var.zones
  ddos_protection_mode    = var.ddos_protection_mode
  ddos_protection_plan_id = var.ddos_protection_plan_id
  domain_name_label       = var.domain_name_label
  edge_zone               = var.edge_zone
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  ip_tags                 = var.ip_tags
  ip_version              = var.ip_version
  public_ip_prefix_id     = var.public_ip_prefix_id
  reverse_fqdn            = var.reverse_fqdn
  sku_tier                = var.sku_tier
  tags                    = merge(var.tags, var.use_tags_default ? local.tags_ip : {})
}
