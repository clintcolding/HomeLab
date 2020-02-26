# Ansible Playbooks

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