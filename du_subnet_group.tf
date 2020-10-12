resource "aws_db_subnet_group" "group" {
  count = local.create_db_subnet_group

  name = local.db_subnet_group_name
  description = "RDS subnet group for ${var.identifier}"
  subnet_ids  = var.db_subnet_group_subnet_ids  
}
