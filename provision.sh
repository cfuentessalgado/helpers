#!/bin/bash
apt-get update
apt-get upgrade -y
apt-get install -y software-properties-common curl
apt-add-repository ppa:nginx/development -y
apt-add-repository ppa:ondrej/php -y
apt-add-repository ppa:chris-lea/redis-server -y
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt-get update
apt-get install -y build-essential dos2unix gcc git git-lfs libmcrypt4 libpcre3-dev libpng-dev chrony unzip make python2.7-dev \
python-pip re2c supervisor unattended-upgrades whois vim libnotify-bin pv cifs-utils mcrypt bash-completion zsh \
graphviz avahi-daemon tshark imagemagick

# Install Generic PHP packages
apt-get install -y --allow-change-held-packages \
php-imagick php-memcached php-redis php-xdebug php-dev

apt-get install -y --allow-change-held-packages \
php7.4 php7.4-bcmath php7.4-bz2 php7.4-cgi php7.4-cli php7.4-common php7.4-curl php7.4-dba php7.4-dev \
php7.4-enchant php7.4-fpm php7.4-gd php7.4-gmp php7.4-imap php7.4-interbase php7.4-intl php7.4-json php7.4-ldap \
php7.4-mbstring php7.4-mysql php7.4-odbc php7.4-opcache php7.4-pgsql php7.4-phpdbg php7.4-pspell php7.4-readline \
php7.4-snmp php7.4-soap php7.4-sqlite3 php7.4-sybase php7.4-tidy php7.4-xml php7.4-xmlrpc php7.4-xsl php7.4-zip

apt-get install apache2
apt-get install libapache2-mod-php7.4
update-alternatives --set php /usr/bin/php7.4
sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.4/cli/php.ini
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.4/cli/php.ini
sudo sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.4/cli/php.ini
sudo sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.4/cli/php.ini
a2enmod php7.4
a2enmod rewrite
systemctl restart apache2
#usermod -a -G www-data ubuntu

# redis memcached y beanstalkd
apt-get install -y redis-server memcached
systemctl enable redis-server
service redis-server start
apt-get install -y sqlite3 libsqlite3-dev
apt-get install -y nodejs
/usr/bin/npm install -g npm
/usr/bin/npm install -g gulp-cli
/usr/bin/npm install -g bower
/usr/bin/npm install -g yarn
/usr/bin/npm install -g grunt-cli
apt-get upgrade -y
apt -y autoremove
apt -y clean

find /var/cache -type f -exec rm -rf {} \;
find /var/log/ -name *.log -exec rm -f {} \;