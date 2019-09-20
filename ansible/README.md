# Ansible Playbooks

## Playbooks

| Playbook | Description |
|----------|-------------|
| azure-agent.yml | Installs prereqs and Azure Pipelines agent |
| common.yml | Configure base RPi and install Docker |
| monitoring.yml | Deploys Grafana and Prometheus service |
| swarm.yml | Configures Docker Swarm |
| telegraf.yml | Installs Telegraf on RPi nodes |
| traefik.yml | Deploys Traefik v1.7 service |
| traefikv2.yml | Deploys Traefik v2.0 service |
| whoami.yml | Deploys basic whoami service |

## Use It

### Vault File

To use these playbooks you need a vault file (containing RPi password), to create the vault file run:

```
ansible-vault create vault.yml
```

You will be prompted to create a password for the vault file itself, then you'll be prompted to create your variables. Add the following to the vault.yml:

```
remote_pass: myrpipass
```

### Run It

```
ansible-playbook -i ./inventory/hosts.yml ./ansible/common.yml --ask-vault-pass
```

This command runs the `common.yml` playbook using the `hosts.yml` host file. Passing `--ask-vault-pass` will prompt you for the password of your vault file.