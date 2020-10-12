variable "create_db_option_group" {
  description = "If true create a db optiongroup for the RDS instance"
  default = true
}

variable "db_option_group_name" {
  description = "(Optional, Forces new resource) The name of the option group. If omitted, Terraform will assign a random, unique name. Must be lowercase, to match as it is stored in AWS."
  default = ""
}
