# Ansible Playbooks

| Playbook | Description |
|----------|-------------|
| azure-agent.yml | Installs prereqs and Azure Pipelines agent |
| clintcolding_web.yml | Deploys clintcolding.com site |
| common.yml | Configures base RPi |
| docker.yml | Installs Docker and configures Swarm |
| monitoring.yml | Deploys Grafana and Prometheus service |
| telegraf.yml | Installs Telegraf on RPi nodes |
| traefikv2.yml | Deploys Traefik v2.0 service |
| pihole_exporter.yml | Deploys a Prometheus exporter for PiHole |
| whoami.yml | Deploys basic whoami service |

### Vault File

You'll need a vault file containing the RPi password, to create the vault file run:

```
ansible-vault create vault.yml
```

Add the following to the vault.yml:

```
remote_pass: myrpipass
```

### Run A Playbook

```
ansible-playbook -i ./inventory/hosts.yml ./ansible/common.yml --ask-vault-pass
```

This command runs the `common.yml` playbook using the `hosts.yml` host file. Passing `--ask-vault-pass` will prompt you for the password of your vault file.