# HomeLab

<p align="center">
    <img src="https://tinyurl.com/y2u66eud" width="800">
</p>

This is a collection of configurations for my Raspberry Pi home lab.

### SSH Configuration

After flashing the SD card, drop an empty file named `ssh` in the boot directory.

### Grafana

<p align="center">
    <img src="https://bit.ly/2k6S7gq" width="800">
</p>

- [ ] Automate configuration

### Telegraf

In order to collect memory metrics you need to enable the memory cgroup by adding `cgroup_enable=memory` to `/boot/cmdline.txt` and then reboot your rpi.

### Azure Runner

> Dependencies can be found [here](https://github.com/microsoft/azure-pipelines-agent/blob/master/src/Misc/layoutbin/installdependencies.sh).

- On rpi01 run `/usr/local/bin/config.sh` to configure the agent.
- Run `/usr/local/bin/svc.sh install` and then `/usr/local/bin/config.sh start` to install and start the service.

#### Using SSH Keys

On the client run the following to create your SSH key (hit enter to save the keys to the default location of ~/.ssh):

`ssh-keygen -b 2048 -t rsa`

On the Raspberry Pi, create a `.ssh` directory and a `authorized_keys` file:

``` bash
mkdir .ssh
cd .ssh
touch authorized_keys
chmod 700 ~/.ssh/
chmod 600 ~/.ssh/authorized_keys
```

Now copy the client SSH key to the Pi:

``` bash
cat ~/.ssh/id_rsa.pub | ssh -p 22 pi@192.168.1.2 'cat >>.ssh/authorized_keys'
```

### Useful Stuff

```
docker stop $(docker ps -a -q)
```