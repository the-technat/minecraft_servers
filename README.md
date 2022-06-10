# minecraft_servers

Repository containing a definition of all my minecraft servers and their configuration.

## Setup

- Create TFE workspace with api-driven workflow, add TFE token as `TF_API_TOKEN` to the Github Repo as secret
- Generate ssh-key of type `ed25519`, add public key to `terraform/locals.tf` and private key to Github Repo as secret names `SSH_KEY`
- Create a read-only token in hetzner cloud project and add it as `HCLOUD_TOKEN` to the Github Repo secrets
- Add / Remove servers in [terraform](./terraform) by copying the [monkey.tf](./terraform/monkey.tf) and editing it
- Change settings for the minecraft server in [settings.yml](./ansible/settings.yml)
- Let the magic happen by adding a new commit to the repo or starting the Deployment from the [Github Actions Page](https://github.com/the-technat/minecraft_servers/actions)

Note: Actual changes only happen on the `main` branch. All other branches get validation and pull-requests get a Terraform plan.

## Terraform

### Generate Documentation

Use [terraform-docs](https://terraform-docs.io/) and the following command to generate the documentation:

```bash
terraform-docs markdown --indent 3 --output-file ../README.md terraform 
```

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | 1.33.2 |
| <a name="requirement_hetznerdns"></a> [hetznerdns](#requirement\_hetznerdns) | 2.1.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_hetznerdns"></a> [hetznerdns](#provider\_hetznerdns) | 2.1.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_monkey"></a> [monkey](#module\_monkey) | app.terraform.io/technat/vm/hcloud | 1.0.1 |

### Resources

| Name | Type |
|------|------|
| [hetznerdns_record.monkey_technat_dev_a](https://registry.terraform.io/providers/timohirt/hetznerdns/2.1.0/docs/resources/record) | resource |
| [hetznerdns_record.monkey_technat_dev_aaaa](https://registry.terraform.io/providers/timohirt/hetznerdns/2.1.0/docs/resources/record) | resource |
| [hetznerdns_zone.technat_dev](https://registry.terraform.io/providers/timohirt/hetznerdns/2.1.0/docs/data-sources/zone) | data source |

### Inputs

No inputs.

### Outputs

No outputs.
<!-- END_TF_DOCS -->
