variable "create_security_group" {
  description = "Boolean to create a new security group or use an existing one"
  type        = bool
  default     = false
}

variable "create_security_group_rules" {
  description = "Boolean to create security group rules"
  type        = bool
  default     = false
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = null
}

variable "security_group_description" {
  description = "The description of the security group"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
  default     = null
}

variable "existing_security_group_id" {
  description = "The ID of an existing security group to which rules will be applied if create_security_group is false"
  type        = string
  default     = null
}

variable "rules_file_path" {
  description = "The path to the JSON file containing the security group rules"
  type        = string
}
