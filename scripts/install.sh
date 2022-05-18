
##install nginx
apt-get install -y nginx
## allow nginx in firewall
sudo ufw allow 'nginx full'
### Add page to nginx
cd /var/www/html
wget "https://github.com/51r/html-page/releases/download/1.2.9/release.zip"
unzip release.zip .
