variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-3" # Paris
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "my_ip" {
  description = "Your public IP for SSH access"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Project     = "VM-EC2-Management"
    Environment = "Lab"
    Owner       = "Serge"
  }
}
