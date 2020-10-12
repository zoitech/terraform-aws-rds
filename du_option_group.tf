resource "aws_db_option_group" "default" {
	count = local.create_db_option_group
  name                     = local.db_option_group_name
  option_group_description = "RDS option group for ${var.identifier}"
  engine_name              = var.engine
  major_engine_version     = var.engine_version
}
