docker run --rm -it \
  --env DISPLAY=:1 \
  --volume DESKTOP_ENVIRONMENT_STATE_X11:/tmp/.X11-unix \
  --volume DESKTOP_ENVIRONMENT_USER_DOWNLOADS:/cloud-computer/virtual-machines \
  --privileged \
  --name systemd-ubuntu \
  --network=host \
  --device /dev/vboxdrv:/dev/vboxdrv \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  -v /tmp:/tmp \
  --interactive \
  --tty \
  virtualbox:latest
