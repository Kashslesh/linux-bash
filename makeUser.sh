#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Run as root"
    exit
fi 

function createUser(){
    local username="$1"
    echo "Create a new user"
    if id "$username" &>/dev/null; then
        echo "User '$username' exists"
        exit 0
    else    
        adduser --disabled-password --gecos "" "$username"
        echo "User '$username' was added"
    fi
}

function setPassword(){
    local username="$1"
    pwd="$2"
    echo "Add password for user:" "$username"
    echo "$username:$pwd" | chpasswd --e
}

function update(){
    apt update
}

function installNginx(){
    apt install nginx -y
}

function configureSite(){
    local site="$1"
    local port="$2"
    local path="/etc/nginx/sites-available"
    local pathOfSite="/etc/nginx/sites-available/$site"
    if [ -e "$pathOfSite" ];then
        echo "$site existe"
        return 1
    fi
    
    cp "./template.conf" "$path/$site"
    sed -i "s/(httpport) .*/$port default_server;/g; s/(site)/$site/g" "$path/$site"

    mkdir -p "/var/www/$site"
    cp "./index.html" "/var/www/$site"
    sed -i "s/(site)/$site/g" "/var/www/$site/index.html"
}
function activeSite(){
    local site="$1"
    local pathOfSite="/etc/nginx/sites-available/${site}"
    if [ ! -e "$pathOfSite" ];then
        echo "$site does not existe"
        return 1
    fi

    local nginxFolder="/etc/nginx/sites-enabled"

    if [ ! -d "$nginxFolder" ]; then
        mkdir -p "$nginxFolder" || { echo "Failed to create directory $nginxFolder"; exit 1; }
    fi

    xdg-open 'http://localhost:8080'

    ln -s "$pathOfSite" "$nginxFolder/${site}" || { echo "Failed to create symbolic link"; exit 1; }
    echo "$site is active"

    echo "Reload nginx"
    systemctl reload nginx

    echo "Openning browser"
}

case $1 in
    install | i)
        update
        installNginx
    ;;
    user | u)
        createUser "$2"
        setPassword "$2" "$3"
    ;;
    configure_site | cs)
        configureSite "$2" "$3"
    ;;
    active_site | as)
        activeSite "$2"
    ;;
    cron_job | cb)
        cronJob "$2"
    ;;
    
esac