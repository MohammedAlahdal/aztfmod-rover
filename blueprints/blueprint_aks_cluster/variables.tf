variable "resource_group_name" {
  description = "(Required) Name of the resource group where to create the aks"
  type        = string
}

variable "location" {
  description = "(Required) Define the region where the resource groups will be created"
  type        = string
}

variable "app_name" {}

variable "env" {}

variable "aks_node_rg" {
  description = "(Optional) The name of the Resource Group where the the Kubernetes Nodes should exist."
  type        = "string"

}

variable "agent_pool_subnet_id" {
  description = "(Required) The ID of the Subnet where the Agents in the Pool should be provisioned."
}

variable "agent_pools" {
  description = "(Optional) List of agent_pools profile for multiple node pools"
  type = list(object({
    name                = string
    count               = number
    vm_size             = string
    os_type             = string
    os_disk_size_gb     = number
    max_pods            = number
    availability_zones  = list(number)
    enable_auto_scaling = bool
    min_count           = number
    max_count           = number
  }))

}

variable "linux_admin_username" {
  description = "(Optional) User name for authentication to the Kubernetes linux agent virtual machines in the cluster."
  type        = "string"

}

variable "kubernetes_version" {
  description = "(Optional) Version of Kubernetes specified when creating the AKS managed cluster"

}

variable "tags" {
  description = "(Required) Map of tags for the deployment"
}

variable "addon_profile" {
  description = "(Optional) AddOn Profile block."
  
}

variable "log_analytics_workspace_id" {
  description = "(Optional) The ID of the Log Analytics Workspace which the OMS Agent should send data to."
  default     = null
}

variable "network_profile" {
  description = "(Optional) Sets up network profile for Advanced Networking."
  
}

variable "service_principal" {
  description = "(Required) The Service Principal to create aks."
  type = object({
    client_id     = string
    client_secret = string
  })
}
