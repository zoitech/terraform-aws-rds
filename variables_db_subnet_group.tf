variable "create_db_subnet_group" {
  description = "If true create a subnet group for the RDS instance"
  default     = true
}

variable "db_subnet_group_name" {
  description = "(Optional, Forces new resource) The name of the DB subnet group. If omitted, Terraform will assign a random, unique name"
  default     = ""
}

variable "db_subnet_group_subnet_ids" {
  description = "(Required) A list of VPC subnet IDs."
  default     = []
}
