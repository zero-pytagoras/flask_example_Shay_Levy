###### Start Safe Header ######
#Developed by: shay.l
#Purpose: Automate deployment of Flask web app with NGINX reverse proxy
#date: 05/04/2025
#version: 0.0.1
set -o errexit
set -o pipefail
###### End Safe Header ########

function software_installation(){
    apt update
    apt install -y vim
    apt install -y git
    apt install -y nginx
}

function configure_nginx(){
    tee /etc/nginx/sites-available/default > /dev/null << 'EOF'
server {
    listen 80;
    server_name localhost;

    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
EOF

    sudo nginx -t && sudo systemctl reload nginx
}

function create_env(){
    mkdir -p /home/$USER/projects
    cd /home/$USER/projects
    git clone https://github.com/shayle664/flask_example.git
    cd flask_example/App
    python3 -m venv .
    source bin/activate
    pip install flask
    pip install gunicorn
    gunicorn --bind 127.0.0.1:5000 app:app &
}

function main() {
    software_installation
    configure_nginx
    create_env
}

main