
## Install nginx
sudo apt-get install -y nginx
## Allow nginx in firewall
sudo ufw allow 'nginx full'
### Add page to nginx
cd /var/www/html
sudo wget "https://github.com/51r/packer-ubuntu-nginx-page/releases/download/1.1.2/release.zip"
## Install unzip to unzip the release
sudo apt-get install -y unzip
# Unzip release.zip
sudo unzip release.zip 
