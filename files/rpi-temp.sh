#!/bin/bash

awk '{print $1/1000}' /sys/class/thermal/thermal_zone0/temp