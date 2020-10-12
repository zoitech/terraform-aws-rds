resource "aws_db_instance" "db_instance" {
  count = local.is_mssql == false ? 1 : 0

  identifier     = var.identifier
  instance_class = var.instance_class

  # engine
  engine         = var.engine
  engine_version = var.engine_version

  # storage
  allocated_storage     = var.allocated_storage
  storage_type          = var.storage_type
  max_allocated_storage = var.max_allocated_storage
  storage_encrypted     = var.storage_encrypted
  kms_key_id            = var.kms_key_id

  # placement
  availability_zone    = var.availability_zone
  multi_az             = var.multi_az
  db_subnet_group_name = var.create_db_subnet_group == true ? aws_db_subnet_group.group[0].name : var.db_subnet_group_name

  # upgrade, maintenance, backup
  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  apply_immediately           = var.apply_immediately
  backup_retention_period     = var.backup_retention_period
  backup_window               = var.backup_window
  delete_automated_backups    = var.delete_automated_backups
  maintenance_window          = var.maintenance_window
  skip_final_snapshot         = var.skip_final_snapshot
  final_snapshot_identifier   = var.final_snapshot_identifier

  # database name
  name = var.name

  # access, security
  username               = var.username
  password               = var.password
  domain                 = var.domain
  domain_iam_role_name   = var.domain_iam_role_name
  ca_cert_identifier     = var.ca_cert_identifier
  publicly_accessible    = var.publicly_accessible
  vpc_security_group_ids = var.vpc_security_group_ids

  # parameters and options
  parameter_group_name = var.create_db_parameter_group == true ? aws_db_parameter_group.default[0].name : null
  option_group_name    = var.create_db_option_group == true ? aws_db_option_group.default[0].name : null
  character_set_name   = local.is_mssql == true ? var.character_set_name : null

  # deletion protection
  deletion_protection = var.deletion_protection

  # logs
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  # tags
  tags = var.tags
}

# ms sql only
resource "aws_db_instance" "db_instance_mssql" {
  count = local.is_mssql == true ? 1 : 0

  identifier     = var.identifier
  instance_class = var.instance_class

  # engine
  engine         = var.engine
  engine_version = var.engine_version

  # storage
  allocated_storage     = var.allocated_storage
  storage_type          = var.storage_type
  max_allocated_storage = var.max_allocated_storage
  storage_encrypted     = var.storage_encrypted
  kms_key_id            = var.kms_key_id

  # placement
  availability_zone    = var.availability_zone
  multi_az             = var.multi_az
  db_subnet_group_name = var.create_db_subnet_group == true ? aws_db_subnet_group.group[0].name : var.db_subnet_group_name

  # upgrade, maintenance, backup
  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  apply_immediately           = var.apply_immediately
  backup_retention_period     = var.backup_retention_period
  backup_window               = var.backup_window
  delete_automated_backups    = var.delete_automated_backups
  maintenance_window          = var.maintenance_window
  skip_final_snapshot         = var.skip_final_snapshot
  final_snapshot_identifier   = var.final_snapshot_identifier

  # access, security
  username               = var.username
  password               = var.password
  domain                 = var.domain
  domain_iam_role_name   = var.domain_iam_role_name
  ca_cert_identifier     = var.ca_cert_identifier
  publicly_accessible    = var.publicly_accessible
  vpc_security_group_ids = var.vpc_security_group_ids

  # parameters and options
  parameter_group_name = var.create_db_parameter_group == true ? aws_db_parameter_group.default[0].name : null
  option_group_name    = var.create_db_option_group == true ? aws_db_option_group.default[0].name : null
  character_set_name   = local.is_mssql == true ? var.character_set_name : null

  # deletion protection
  deletion_protection = var.deletion_protection

  # logs
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  # mssql specific
  timezone      = var.timezone
  license_model = "license-included"

  # tags
  tags = var.tags
}
