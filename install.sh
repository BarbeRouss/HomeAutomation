# Permet la création d'un user nécessaire pour lancer une commande depuis homeassistant pour le wakeonlan

apt-get install wakeonlan
adduser --disabled-password --gecos "" hass_wakeonlan
#mkdir hass-config/.ssh
#docker-compose exec hass ssh-keygen -t rsa -b 4096 -f /config/.ssh/id_rsa -q -N ""

mkdir -p /home/hass_wakeonlan/.ssh
cat hass-config/.ssh/id_rsa.pub > /home/hass_wakeonlan/.ssh/authorized_keys
chown -R hass_wakeonlan:hass_wakeonlan /home/hass_wakeonlan/.ssh 

# Try if the connection works from inside the container, and accept the key fingerprint
docker-compose exec hass ssh hass_wakeonlan@192.168.0.201

#docker-compose up -d