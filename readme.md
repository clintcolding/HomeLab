# HomeLab

<p align="center">
    <img src="https://tinyurl.com/y2u66eud" width="800">
</p>

This is a collection of configurations for my Raspberry Pi home lab.

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

In order to collect memory metrics you need to enable the memory cgroup by adding `cgroup_enable=memory` to `/boot/cmdline.txt` and then rebooting your rpi.

> This is a task in the `install_telegraf` playbook.

### Useful Stuff

```
docker stop $(docker ps -a -q)
```