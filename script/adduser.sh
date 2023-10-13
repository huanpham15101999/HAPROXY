#!/bin/bash
nguoi_dung1="huanpd"
public_key1="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsm4zmLnVef7QolaDIITTvFN6mdkTTRFtMX7gQNVJRkOqh9bMK/RXXx1qxJmnUxJebjvJzDN2NNVb6+rmaYNQuDRMgHJOc0lLWt6S4+tcD0XKjQuN/GkhJoYQ7AbpM1CbYNPzeHSEOK32Q4pWEg3OoW24+M8qGcbjYn+U1jitA4vbeqTIbmmjNuogC6K2Ld0uvxXcMtqaf8rEP9cmP/mHwwrTJOChBjnGsQiA+c6m3OSwql3sTMVQDjJf9YqG7P9V9A1hu8Gy7/i1WI7Dl5HTx2hX+2whDIWLbKCDcgFybdop9CmmQAPm5gZe6WdHZ9a5AqJQVx6XPxpc4o3AEE+bt5T9mjMU1aOiVcBkmHrdCXQeHo3563PdXr1pak7GZ6bDH+Gk8U3bEVHIE5nW/D/enG3TGV2eE426Y70Dd/5J7Dhsun/YSwo3w6RyiDqW0eVadtqBaRQjpxS/paDmMrjTy3K2NwWiKHZpfSaqrnjT2b3plhM84/DjmcZG4+WXfQtM= huan@dell"
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
