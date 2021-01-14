docker run --rm -it \
  --env DISPLAY=:0 \
  --volume /tmp/.X11-unix=/tmp/.X11-unix \
  --privileged \
  --name systemd-ubuntu \
  --network=host \
  --device /dev/vboxdrv:/dev/vboxdrv \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  -v /tmp:/tmp -it jrei/systemd-ubuntu
