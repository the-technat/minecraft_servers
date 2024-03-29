# minecraft_servers

 Proof of Concept how you could automate your minecraft server deployment.

## Setup

- Fork the repository
- Create TFE workspace with api-driven workflow, add a generated TFE token (with access to that workspace) as `TF_API_TOKEN` to the Github Repo secrets
- Generate a ssh-key of type `ed25519`. The public key should be in the `local.ssh_keys` var of [terraform/servers.tf](terraform/servers.tf) and the private key should be in the Github repo secrets as `SSH_KEY`
- Create a read-only token in a hetzner cloud project and add it as `HCLOUD_TOKEN` to the Github repo secrets
- Add / Remove servers in [terraform/servers.tf](terraform/servers.tf) 
- Add / Change minecraft settings either in [ansible/groups_vars/all.yml](ansible/group_vars/all.yml) or per server in [ansible/host_vars/servername.yml](ansible/host_vars) 
- Let the magic happen by heading to the Github Actions tab and triggering the "Continuous Deployment" workflow 

Note: Deployment's are only done on `main` branch. All other branches will get validation for Terraform & Ansible and if you use a PR to change something on `main` (rather than a commit which directly triggers the deployment) you can see a Terraform plan in your PR with the changes that you suggest.

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
