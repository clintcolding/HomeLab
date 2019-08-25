# HomeLab

<p align="center">
    <img src="https://tinyurl.com/y2u66eud" width="800">
</p>

This is a collection of Ansible playbooks for my Raspberry Pi home lab.

### SSH Configuration

After flashing the SD card, drop an empty file named `ssh` in the boot directory.

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

### Prometheus

Copy configuration

```
cat prometheus.yml | ssh pi@192.168.1.133 'cat >> /tmp/prometheus.yml'
```

Start the Prometheus container and bind a config from the docker host.

```
sudo docker run --name prom -d -p 9090:9090 -v /tmp/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
```

### Telegraf

In order to collect memory metrics you need to enable the memory cgroup by adding `cgroup_enable=memory` to `/boot/cmdline.txt` and then reboot your rpi.

### Useful Stuff

```
docker stop $(docker ps -a -q)
```