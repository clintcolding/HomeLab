## Prometheus

Copy configuration

```
cat prometheus.yml | ssh pi@192.168.1.133 'cat >> /tmp/prometheus.yml'
```

Start the Prometheus container and bind a config from the docker host.

```
sudo docker run --name prom -d -p 9090:9090 -v /tmp/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
```

## Telegraf

Copy telegraf config to host tmp directory

```
cat telegraf.conf | ssh pi@192.168.1.133 'cat >> /tmp/telegraf.conf'
```

Move it default location and restart service

```
sudo mv /tmp/telegraf.conf /etc/telegraf/
sudo service telegraf restart
```

## Get Container Memory Stats

You need to enable the memory cgroup, the file to edit is `/boot/cmdline.txt`

Add the follow line to the list `cgroup_enable=memory` and reboot your host.

## Stop All Containers

```
docker stop $(docker ps -a -q)
```