
##install nginx
apt-get install -y nginx
## allow nginx in firewall
sudo ufw allow 'nginx full'
### Add site configuration to nginx
cd /etc/nginx/sites-available/
wget "https://github.com/51r/html-page/releases/download/1.2.9/release.zip"
unzip release.zip .
