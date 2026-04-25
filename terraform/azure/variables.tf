variable "location" {
  description = "Azure region"
  type        = string
  default     = "FranceCentral"
}

variable "vm_name" {
  description = "Name of the VM"
  type        = string
  default     = "vm-serge"
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "sergeadmin"
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
}
