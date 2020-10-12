resource "aws_db_parameter_group" "default" {
  count       = local.create_db_parameter_group
  name        = local.db_parameter_group_name
  description = "RDS parameter group for ${var.identifier}"
  family      = "${var.engine}${var.engine_version}"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}
