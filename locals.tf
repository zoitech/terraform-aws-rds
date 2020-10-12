locals {
  ## db subnet group ##
  create_db_subnet_group = var.create_db_subnet_group == true ? 1 : 0
  db_subnet_group_name   = var.db_subnet_group_name == "" ? var.identifier : var.db_subnet_group_name

  ## db option group ##
  create_db_option_group = var.create_db_option_group == true ? 1 : 0
  db_option_group_name   = var.db_option_group_name == "" ? var.identifier : var.db_option_group_name

  ## db parameter group ##
  create_db_parameter_group = var.create_db_parameter_group == true ? 1 : 0
  db_parameter_group_name   = var.db_parameter_group_name == "" ? var.identifier : var.db_parameter_group_name

  ## rds instance ##
  is_mssql = length(regexall("^sqlserver.*", var.engine)) > 0
}

