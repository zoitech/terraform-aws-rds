variable "allocated_storage" {
  description = "The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs."
  default     = 150
}

variable "storage_type" {
  description = "One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD). The default is io1 if iops is specified, gp2 if not"
  default     = "gp2"
}

variable "engine" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) The database engine to use. For supported values, see the Engine parameter in API action CreateDBInstance. Note that for Amazon Aurora instances the engine must match the DB cluster's engine'. For information on the difference between the available Aurora MySQL engines see Comparison between Aurora MySQL 1 and Aurora MySQL 2 in the Amazon RDS User Guide"
  default     = "mysql"
}

variable "engine_version" {
  description = "(Optional) The engine version to use. If auto_minor_version_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10) and this attribute will ignore differences in the patch version automatically (e.g. 5.7.17). For supported values, see the EngineVersion parameter in API action CreateDBInstance. Note that for Amazon Aurora instances the engine version must match the DB cluster's engine version"
  default     = ""
}

variable "availability_zone" {
  description = "(Optional) The AZ for the RDS instance."
  default     = ""
}


variable "allow_major_version_upgrade" {
  description = "(Optional) Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible."
  default     = false
}

variable "apply_immediately" {
  description = "(Optional) Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false."
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "(Optional) Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Defaults to true."
  default     = "true"
}
# https://aws.amazon.com/rds/instance-types/
variable "instance_class" {
  description = "(Required) The instance type of the RDS instance."
  default     = "db.t3.large"
}

variable "name" {
  description = "(Optional) The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance. Note that this does not apply for Oracle or SQL Server engines"
  default     = "defaultdatabase"
}

variable "username" {
  description = "(Required) Username for the master DB user."
  default     = "trumpf-admin"
}

variable "password" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
  default     = ""
}

variable "parameter_group_name" {
  description = "(Optional) Name of the DB parameter group to associate."
  default     = ""
}

variable "option_group_name" {
  description = "(Optional) Name of the DB option group to associate."
  default     = ""
}

variable "backup_retention_period" {
  description = "(Optional) The days to retain backups for. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica."
  default     = 14
}

variable "backup_window" {
  description = "(Optional) The daily time range (in UTC) during which automated backups are created if they are enabled. Example: 09:46-10:16. Must not overlap with maintenance_window"
  default     = "19:30-20:00"
}

variable "maintenance_window" {
  description = "(Optional) The window to perform maintenance in. Syntax: ddd:hh24:mi-ddd:hh24:mi. Eg: Mon:00:00-Mon:03:00"
  default     = "sun:20:00-sun:20:30"
}

variable "ca_cert_identifier" {
  description = "(Optional) The identifier of the CA certificate for the DB instance"
  default     = ""
}

variable "character_set_name" {
  description = "(Optional) The character set name to use for DB encoding in Oracle and Microsoft SQL instances (collation). This can't be changed."
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "delete_automated_backups" {
  description = "(Optional) Specifies whether to remove automated backups immediately after the DB instance is deleted. Default is true"
  default     = true
}

variable "deletion_protection" {
  description = "(Optional) If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true."
  default     = true
}

variable "domain" {
  description = "(Optional) The ID of the Directory Service Active Directory domain to create the instance in"
  default     = ""
}

variable "domain_iam_role_name" {
  description = "(Optional, but required if domain is provided) The name of the IAM role to be used when making API calls to the Directory Service"
  default     = ""
}

variable "enabled_cloudwatch_logs_exports" {
  description = "(Optional) List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine). MySQL and MariaDB: audit, error, general, slowquery. PostgreSQL: postgresql, upgrade. MSSQL: agent , error. Oracle: alert, audit, listener, trace."
  default     = []
}

variable "skip_final_snapshot" {
  description = "(Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier. Default is false."
  default     = true
}

variable "final_snapshot_identifier" {
  description = "(Optional) The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip_final_snapshot is set to false."
  default     = null
}

variable "identifier" {
  description = "(Optional, Forces new resource) The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier."
  default     = ""
}

variable "storage_encrypted" {
  description = "(Optional) Specifies whether the DB instance is encrypted. Note that if you are creating a cross-region read replica this field is ignored and you should instead declare kms_key_id with a valid ARN. The default is false if not specified."
  default     = false
}
variable "kms_key_id" {
  description = "(Optional) The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN"
  default     = ""
}

variable "max_allocated_storage" {
  description = "(Optional) When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage. Must be greater than or equal to allocated_storage or 0 to disable Storage Autoscaling."
  default     = 0
}

variable "multi_az" {
  description = "(Optional) Specifies if the RDS instance is multi-AZ"
  default     = false
}

variable "publicly_accessible" {
  description = "(Optional) Bool to control if instance is publicly accessible. Default is false"
  default     = false
}

variable "vpc_security_group_ids" {
  description = "(Optional) List of VPC security groups to associate."
  default     = []
}

# tags
variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  default     = {}
}


# ms sql only
variable "timezone" {
  type        = string
  description = "(Optional) Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation. See MSSQL User Guide for more information."
  default     = ""
}
