docker run --rm -it \
  --volume DESKTOP_ENVIRONMENT_USER_DOWNLOADS:/cloud-computer/virtual-machines \
  --privileged \
  --name vbox-windows \
  --network=host \
  --device /dev/vboxdrv:/dev/vboxdrv \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
  --interactive \
  --tty \
  virtualbox:latest
