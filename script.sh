cd /home/
 mkdir ubuntu
 cd ubuntu
 sudo ufw allow 9444/tcp
 sudo apt update
 sudo apt install haveged -y
 sudo apt install openjdk-8-jdk -y
 sudo apt install supervisor -y
 git clone https://github.com/n-y-z-o/nyzoVerifier.git
 cd nyzoVerifier
 ./gradlew build
 sudo mkdir -p /var/lib/nyzo/production
 sudo cp trusted_entry_points /var/lib/nyzo/production
 sudo cp nyzoVerifier.conf /etc/supervisor/conf.d
 #########################
 sudo bash -c 'echo "INSERT YOUR USERNAME HERE" > /var/lib/nyzo/production/nickname'
 #########################
 sudo supervisorctl reload
 sudo supervisorctl status
 echo "@reboot sudo supervisorctl reload" >> mycron
 crontab mycron
 rm mycron
