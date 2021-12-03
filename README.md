# terraform-aws-rds

Terraform module for creating RDS instances

## Description

The following resources can/will be created:

* RDS instance
* Optional option group
* Optional parameter group
* Optional subnet group

The module is currently designed for mysql and mssql only. Engine types:

* mysql
* sqlserver-ee
* sqlserver-se
* sqlserver-ex
* sqlserver-web

For engine information, please refer to the following links:

* https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBInstance.html
* https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
* https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SQLServer.html#SQLServer.Concepts.General.VersionSupport

## Usage

```hcl
module "rds_mssql" {
  source = "git::https://github.com/zoitech/terraform-aws-rds.git"
  
  # name and class
  identifier = "myrdsinstancename"
  instance_class = "db.t3.large" 
  database_name = "mytestdatabase"

  # engine
  engine = "sqlserver-se"
  engine_version = "13.00.5820.21.v1"

  availability_zone           = "eu-central-1a"
  db_subnet_group_name        = "main"
  create_db_option_group      = false
  create_db_parameter_group   = false
  multi_az                    = false
  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = true

  username = "myusername"
  password = "mypassword"

  deletion_protection = true

  # Tagging
  tags = {
      Name           = "myrdsinstancename"
      application    = "my-application-name-test"
  }
}
```hcl

### Referencing a Version Tag

Please refer to [CHANGELOG.md](CHANGELOG.md) for the latest release.

```hcl
module "rds_mssql" {
  source = "git::https://github.com/zoitech/terraform-aws-rds.git?ref=1.0.0"
}
```hcl
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.db_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_instance.db_instance_mssql](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_option_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_option_group) | resource |
| [aws_db_parameter_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_db_subnet_group.group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | The allocated storage in gibibytes. If max\_allocated\_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. | `number` | `150` | no |
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | (Optional) Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible. | `bool` | `false` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | (Optional) Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false. | `bool` | `false` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | (Optional) Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Defaults to true. | `string` | `"true"` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | (Optional) The AZ for the RDS instance. | `string` | `""` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | (Optional) The days to retain backups for. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica. | `number` | `14` | no |
| <a name="input_backup_window"></a> [backup\_window](#input\_backup\_window) | (Optional) The daily time range (in UTC) during which automated backups are created if they are enabled. Example: 09:46-10:16. Must not overlap with maintenance\_window | `string` | `"19:30-20:00"` | no |
| <a name="input_ca_cert_identifier"></a> [ca\_cert\_identifier](#input\_ca\_cert\_identifier) | (Optional) The identifier of the CA certificate for the DB instance | `string` | `""` | no |
| <a name="input_character_set_name"></a> [character\_set\_name](#input\_character\_set\_name) | (Optional) The character set name to use for DB encoding in Oracle and Microsoft SQL instances (collation). This can't be changed. | `string` | `"SQL_Latin1_General_CP1_CI_AS"` | no |
| <a name="input_create_db_option_group"></a> [create\_db\_option\_group](#input\_create\_db\_option\_group) | If true create a db optiongroup for the RDS instance | `bool` | `true` | no |
| <a name="input_create_db_parameter_group"></a> [create\_db\_parameter\_group](#input\_create\_db\_parameter\_group) | If true create a db parameter group for the RDS instance. | `bool` | `true` | no |
| <a name="input_create_db_subnet_group"></a> [create\_db\_subnet\_group](#input\_create\_db\_subnet\_group) | If true create a subnet group for the RDS instance | `bool` | `true` | no |
| <a name="input_db_option_group_name"></a> [db\_option\_group\_name](#input\_db\_option\_group\_name) | (Optional, Forces new resource) The name of the option group. If omitted, Terraform will assign a random, unique name. Must be lowercase, to match as it is stored in AWS. | `string` | `""` | no |
| <a name="input_db_parameter_group_name"></a> [db\_parameter\_group\_name](#input\_db\_parameter\_group\_name) | (Optional) The description of the DB parameter group.If true create a db parameter group for the RDS instance.If omitted, Terraform will assign a random, unique name | `string` | `""` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | (Optional, Forces new resource) The name of the DB subnet group. If omitted, Terraform will assign a random, unique name | `string` | `""` | no |
| <a name="input_db_subnet_group_subnet_ids"></a> [db\_subnet\_group\_subnet\_ids](#input\_db\_subnet\_group\_subnet\_ids) | (Required) A list of VPC subnet IDs. | `list` | `[]` | no |
| <a name="input_delete_automated_backups"></a> [delete\_automated\_backups](#input\_delete\_automated\_backups) | (Optional) Specifies whether to remove automated backups immediately after the DB instance is deleted. Default is true | `bool` | `true` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | (Optional) If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true. | `bool` | `true` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | (Optional) The ID of the Directory Service Active Directory domain to create the instance in | `string` | `""` | no |
| <a name="input_domain_iam_role_name"></a> [domain\_iam\_role\_name](#input\_domain\_iam\_role\_name) | (Optional, but required if domain is provided) The name of the IAM role to be used when making API calls to the Directory Service | `string` | `""` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | (Optional) List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine). MySQL and MariaDB: audit, error, general, slowquery. PostgreSQL: postgresql, upgrade. MSSQL: agent , error. Oracle: alert, audit, listener, trace. | `list` | `[]` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | (Required unless a snapshot\_identifier or replicate\_source\_db is provided) The database engine to use. For supported values, see the Engine parameter in API action CreateDBInstance. Note that for Amazon Aurora instances the engine must match the DB cluster's engine'. For information on the difference between the available Aurora MySQL engines see Comparison between Aurora MySQL 1 and Aurora MySQL 2 in the Amazon RDS User Guide | `string` | `"mysql"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | (Optional) The engine version to use. If auto\_minor\_version\_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10) and this attribute will ignore differences in the patch version automatically (e.g. 5.7.17). For supported values, see the EngineVersion parameter in API action CreateDBInstance. Note that for Amazon Aurora instances the engine version must match the DB cluster's engine version | `string` | `""` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | (Optional) The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip\_final\_snapshot is set to false. | `any` | `null` | no |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | (Optional, Forces new resource) The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier. | `string` | `""` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | (Required) The instance type of the RDS instance. | `string` | `"db.t3.large"` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | (Optional) The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN | `string` | `""` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | (Optional) The window to perform maintenance in. Syntax: ddd:hh24:mi-ddd:hh24:mi. Eg: Mon:00:00-Mon:03:00 | `string` | `"sun:20:00-sun:20:30"` | no |
| <a name="input_max_allocated_storage"></a> [max\_allocated\_storage](#input\_max\_allocated\_storage) | (Optional) When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated\_storage. Must be greater than or equal to allocated\_storage or 0 to disable Storage Autoscaling. | `number` | `0` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | (Optional) Specifies if the RDS instance is multi-AZ | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | (Optional) The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance. Note that this does not apply for Oracle or SQL Server engines | `string` | `"defaultdatabase"` | no |
| <a name="input_option_group_name"></a> [option\_group\_name](#input\_option\_group\_name) | (Optional) Name of the DB option group to associate. | `string` | `""` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | (Optional) Name of the DB parameter group to associate. | `string` | `""` | no |
| <a name="input_password"></a> [password](#input\_password) | (Required unless a snapshot\_identifier or replicate\_source\_db is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. | `string` | `""` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | (Optional) Bool to control if instance is publicly accessible. Default is false | `bool` | `false` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | (Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final\_snapshot\_identifier. Default is false. | `bool` | `true` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | (Optional) Specifies whether the DB instance is encrypted. Note that if you are creating a cross-region read replica this field is ignored and you should instead declare kms\_key\_id with a valid ARN. The default is false if not specified. | `bool` | `false` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD). The default is io1 if iops is specified, gp2 if not | `string` | `"gp2"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to assign to the resource. | `map` | `{}` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | (Optional) Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation. See MSSQL User Guide for more information. | `string` | `""` | no |
| <a name="input_username"></a> [username](#input\_username) | (Required) Username for the master DB user. | `string` | `"trumpf-admin"` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | (Optional) List of VPC security groups to associate. | `list` | `[]` | no |

## Outputs

No outputs.
