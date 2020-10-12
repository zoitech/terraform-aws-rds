variable "create_db_parameter_group" {
  description = "If true create a db parameter group for the RDS instance."
  default = true
}

variable "db_parameter_group_name" {
  description = "(Optional) The description of the DB parameter group.If true create a db parameter group for the RDS instance.If omitted, Terraform will assign a random, unique name"
  default = ""
}
