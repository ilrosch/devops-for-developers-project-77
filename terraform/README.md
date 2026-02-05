# Deploy infrastructure with Terraform

Deploy infrastructure for Redmine application.

---

## Infrastructure

- PostgresDB
- Virtual machines - 2
- L7 Application Load Balancer

---

## Requirements

- **Terraform** >= 1.15
- **Yandex Cloud** ([docs](https://yandex.cloud/en/docs/tutorials/infrastructure-management/terraform-quickstart))
- **Make**

---

## Preparing

Create `secret.auto.tfvars` with your data yandex cloud:

```
yc_token     = "<your-token>"
yc_cloud_id  = "<your-cloud-id>"
yc_folder_id = "<your-folder-id>"
yc_zone      = "<your-zone>"
```

Create `secret.backend.tfvars` with your data ([docs](https://yandex.cloud/en/docs/tutorials/infrastructure-management/terraform-state-storage)):

```
bucket     = "<your-name>"
access_key = "<your-access-key>"
secret_key = "<your-secret-key>"
```

Create `secret.database.auto.tfvars` with your data:

```
db_version  = <postgres-version>
db_name     = "<your-db-name>"
db_port     = 6432
db_user     = "<your-username>"
db_password = "<your-password>"
```

Create `secret.dns.auto.tfvars` with your domain:

```
domain = "<your-domain>"
```

Create `secret.dd.auto.tfvars` with your DataDog data:

```
dd_api_key = "<your-datadog-api-key>"
dd_api_url = "<your-datadog-api-url>"
dd_app_key = "<your-datadog-app-key>"
```

---

## Get started

Deploy infrastructure with one command:

```
make setup
```

Other commands:

```
make tf-init        # Initialize Terraform (download providers and modules)

make tf-upgrade     # Upgrade providers to the latest allowed versions

make tf-destroy     # Destroy infrastructure

make tf-deploy      # Deploy infrastructure

make tf-plan        # Generate an execution plan for infrastructure changes

make tf-format      # Apply standard formatting to all .tf files recursively

make tf-validate    # Validate Terraform configuration syntax and structure
```

---

## Example

Deploy:

[![asciicast](https://asciinema.org/a/beySpavaZMPbm4oC.svg)](https://asciinema.org/a/beySpavaZMPbm4oC)

Destroy:

[![asciicast](https://asciinema.org/a/vSipdadQ28lBQKX4.svg)](https://asciinema.org/a/vSipdadQ28lBQKX4)
