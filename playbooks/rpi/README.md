```
ansp -i raspberrypi, -u pi -k -e "hostname=rpi-3 password=h9PALpMB8jXs9odwiO7Y" prepare.yml
ansp -i rpi-3, -u pi -e "ansible_password=h9PALpMB8jXs9odwiO7Y" hyperpixel4.yml
ansp -i rpi-3, -u pi -e "ansible_password=h9PALpMB8jXs9odwiO7Y" kiosk.yml
```