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
module "bdp_buckets" {
  source = "git::https://github.com/zoitech/terraform-aws-rds.git?ref=1.0.0"
}
```hcl
