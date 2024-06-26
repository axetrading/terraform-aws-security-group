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

variable "load_from_s3" {
  description = "Flag to determine if the security group rules should be loaded from S3"
  type        = bool
  default     = false
}

variable "s3_bucket" {
  description = "The S3 bucket containing the security group rules JSON"
  type        = string
  default     = ""
}

variable "s3_key" {
  description = "The S3 key (path) of the security group rules JSON"
  type        = string
  default     = ""
}

variable "rules_file_path" {
  description = "The local file path for the security group rules JSON"
  type        = string
  default     = ""
}

