#!/bin/bash
nguoi_dung1="huanpd"
public_key1="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD3W5VaZIMegL1Bn0sKes2YiRvOuqkaZW+ZPumUFU7wxm+O/X2Vmm64Izy/n0CElrCTz3rpzixvUml/2fIj48vpVwq5OxgrczUsOhBOXI8FgKk0XC7XbhGxR7Ll476yp8ZUw7PodrF/rN3EOfjivua/xWS3Rer2poz4+zN3t+639pCxCM939PuTxuzF2cIhtlfh3zZYsQPaPsCYuBrlTzhA8NFozDceg0WxLG75JZMaMr5/NEg3std5Mrx6fvJrRdyRGTUQ0ZdMwN0hqIygyelZsMQQ3e8yHRAxpsBR606wrWaP+Pjy1DvqieGX+/kuD1Oe4kYZb+KHDMsxrUC0eo+p25hpicQYToWba7XV69mlvWdYyWd8t3YbJ427sgtpB+BtNesD4mvy3jM71UoYmUISQ+6k4bZjO/pOq/+/R+9KHGsfvtdtZaJVNwUb2q6jhpCeMNGBob8777DYTdKC84n713bfycTBJQKpBQn1bsQtc45pmatlITSFcCSJKa+xUwE= huan@dell"
useradd $nguoi_dung1 -m  -s /bin/bash
mkdir /home/$nguoi_dung1/.ssh
echo "$public_key1" > /home/$nguoi_dung1/.ssh/authorized_keys
chown -R $nguoi_dung1. /home/$nguoi_dung1
chmod 700  /home/$nguoi_dung1/.ssh/
chmod 600  /home/$nguoi_dung1/.ssh/authorized_keys
echo "$nguoi_dung1  ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$nguoi_dung1
chmod 440 /etc/sudoers.d/$nguoi_dung1
echo "AllowUsers $nguoi_dung1" >> /etc/ssh/sshd_config
service ssh restart
