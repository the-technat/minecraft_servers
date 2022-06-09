# minecraft_servers

Repository containing a definition of all my minecraft servers and their configuration.

## Ansible

## Terraform

### Trigger

Terraform confgiuration is autoread by [Terraform Cloud](https://app.terraform.io) and applyed as it's merged to main.

### Generate Documentation

Use [terraform-docs](https://terraform-docs.io/) and the following command to generate the documentation:

```bash
terraform-docs markdown --indent 3 --output-file README.md ./terraform 
```

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->
