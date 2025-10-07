#!/bin/sh

while true
do
  devcds=`find /sys/class/remoteproc/remoteproc1/device/dump -name core 2>/dev/null`
  firmware=`cat /sys/class/remoteproc/remoteproc1/firmware`
  firmwarepath="/vendor/firmware/$firmware"
  for i in $devcds; do
    echo "Found a devcoredump at $i."
    mkdir -p /data/vendor/pqu_coredump
    dd if=/sys/class/remoteproc/remoteproc1/device/dump/mem of=/data/vendor/pqu_coredump/mem.bin
    dd if=/sys/class/remoteproc/remoteproc1/device/dump/core of=/data/vendor/pqu_coredump/pqu.cdmp
    dd if=$firmwarepath of=/data/vendor/pqu_coredump/$firmware
    sync
    echo "Saved PQU coredump to /data/pqu_coredump"
    exit 0
  done
  sleep 10
done