# Azure Public IP for multiples accounts with Terraform module
* This module simplifies creating and configuring of Public IP across multiple accounts on Azure

* Is possible use this module with one account using the standard profile or multi account using multiple profiles setting in the modules.

## Actions necessary to use this module:

* Criate file provider.tf with the exemple code below:
```hcl
provider "azurerm" {
  alias   = "alias_profile_a"

  features {}
}

provider "azurerm" {
  alias   = "alias_profile_b"

  features {}
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}
```


## Features enable of Public IP configurations for this module:

- Public IP

## Usage exemples


### Create Public IP

```hcl
module "public_ip_test" {
  source = "web-virtua-azure-multi-account-modules/public-ip/azurerm"

  name                = "tf-test-static-ip"
  resource_group_name = var.resource_group_name

  providers = {
    azurerm = azurerm.alias_profile_b
  }
}
```

## Variables

| Name | Type | Default | Required | Description | Options |
|------|-------------|------|---------|:--------:|:--------|
| name | `string` | `-` | yes | Public IP name | `-` |
| resource_group_name | `string` | `-` | yes | Resource group name | `-` |
| allocation_method | `string` | `Static` | no | Defines the allocation method for this IP address. Possible values are Static or Dynamic | `*`Static <br> `*`Dynamic |
| sku | `string` | `Standard` | no | The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic | `*`Basic <br> `*`Standard |
| zones | `list(string)` | `null` | no | A collection containing the availability zone to allocate the Public IP in. Changing this forces a new resource to be created | `-` |
| ddos_protection_mode | `string` | `null` | no | The DDoS protection mode of the public IP. Possible values are Disabled, Enabled, and VirtualNetworkInherited. Defaults to VirtualNetworkInherited | `-` |
| ddos_protection_plan_id | `string` | `null` | no | The ID of DDoS protection plan associated with the public IP | `-` |
| domain_name_label | `string` | `null` | no | Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system | `-` |
| edge_zone | `string` | `null` | no | Specifies the Edge Zone within the Azure Region where this Public IP should exist. Changing this forces a new Public IP to be created | `-` |
| idle_timeout_in_minutes | `number` | `null` | no | Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes | `-` |
| ip_version | `string` | `null` | no | The IP Version to use, IPv6 or IPv4. Changing this forces a new resource to be created | `-` |
| public_ip_prefix_id | `string` | `null` | no | If specified then public IP address allocated will be provided from the public IP prefix resource. Changing this forces a new resource to be created | `-` |
| reverse_fqdn | `string` | `null` | no | A fully qualified domain name that resolves to this public IP address. If the reverseFqdn is specified, then a PTR DNS record is created pointing from the IP address in the in-addr.arpa domain to the reverse FQDN | `-` |
| sku_tier | `string` | `null` | no | The SKU Tier that should be used for the Public IP. Possible values are Regional and Global. Defaults to Regional | `-` |
| use_tags_default | `bool` | `true` | no | If true will be use the tags default to resources | `*`false <br> `*`true |
| tags | `map(any)` | `{}` | no | Tags to virtual Public IP | `-` |
| ip_tags | `map(any)` | `{}` | no | Tags to assign to the public IP | `-` |


## Resources

| Name | Type |
|------|------|
| [azurerm_public_ip.create_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |

## Outputs

| Name | Description |
|------|-------------|
| `ip` | Public IP |
| `ip_id` | Public IP ID |
| `ip_address` | IP address |
| `ip_sku` | Public IP SKU |
