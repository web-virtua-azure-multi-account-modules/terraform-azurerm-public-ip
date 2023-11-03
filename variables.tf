variable "name" {
  description = "Virtual machine name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic"
  type        = string
  default     = "Static"
}

variable "sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic"
  type        = string
  default     = "Standard"
}

variable "zones" {
  description = "A collection containing the availability zone to allocate the Public IP in. Changing this forces a new resource to be created"
  type        = list(string)
  default     = null
}

variable "ddos_protection_mode" {
  description = "The DDoS protection mode of the public IP. Possible values are Disabled, Enabled, and VirtualNetworkInherited. Defaults to VirtualNetworkInherited"
  type        = string
  default     = null
}

variable "ddos_protection_plan_id" {
  description = "The ID of DDoS protection plan associated with the public IP"
  type        = string
  default     = null
}

variable "domain_name_label" {
  description = "Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system"
  type        = string
  default     = null
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Public IP should exist. Changing this forces a new Public IP to be created"
  type        = string
  default     = null
}

variable "idle_timeout_in_minutes" {
  description = "Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes"
  type        = number
  default     = null
}

variable "ip_version" {
  description = "The IP Version to use, IPv6 or IPv4. Changing this forces a new resource to be created"
  type        = string
  default     = null
}

variable "public_ip_prefix_id" {
  description = "If specified then public IP address allocated will be provided from the public IP prefix resource. Changing this forces a new resource to be created"
  type        = string
  default     = null
}

variable "reverse_fqdn" {
  description = "A fully qualified domain name that resolves to this public IP address. If the reverseFqdn is specified, then a PTR DNS record is created pointing from the IP address in the in-addr.arpa domain to the reverse FQDN"
  type        = string
  default     = null
}

variable "sku_tier" {
  description = "The SKU Tier that should be used for the Public IP. Possible values are Regional and Global. Defaults to Regional"
  type        = string
  default     = null
}

variable "use_tags_default" {
  description = "If true will be use the tags default to resources"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to virtual machine"
  type        = map(any)
  default     = {}
}

variable "ip_tags" {
  description = "IP tags to assign to the public IP"
  type        = map(any)
  default     = {}
}
