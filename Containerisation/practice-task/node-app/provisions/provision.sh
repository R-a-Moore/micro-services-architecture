sudo apt-get update -y
  
 sudo apt-get upgrade -y
  
sudo apt-get install nginx -y
  
sudo apt-get purge nodejs npm -y
  
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  
sudo apt-get install -y nodejs npm
# stores an environment variable 
echo "DB_HOST=mongodb://192.168.10.150:27017/posts" | sudo tee -a /etc/environment
# uncomment this line once the db is available and replace the this ip with the instance db ip

cd app

cd app

sudo cp -f rev_proxy /etc/nginx/sites-available/default

sudo systemctl restart nginx
  
sudo apt-get update -y
  
sudo apt-get upgrade -y

cd seeds

node seed.js

cd ..

sudo npm install express

npm start