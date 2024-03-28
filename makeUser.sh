#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Run as root"
    exit
fi 

function createUser(){
    username="$1"
    echo $username
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
    username="$1"
    pwd="$2"
    echo "Add password for user:" "$username"
    echo "$username:$pwd" | chpasswd --e
}

function install(){
    apt update
}

function installNginx(){
    apt install nginx
}
function tepmpate(){
    echo "$site"
}
function configure_site(){
    site="$1"
    port="$2"
    path="/etc/nginx/sites-available"
    pathOfSite="/etc/nginx/sites-available/$site"
    if [ -e "$pathOfSite" ];then
        echo "$site existe"
        return 1
    fi
    
    cp "./template.conf" "$path"
    mkdir -p "/var/www/$site"

    echo "$site" > "/var/www/$site/index.html"
}

case $1 in
    install | i)
        install
        installNginx
    ;;
    user | u)
        createUser "$2"
        setPassword "$2" "$3"
    ;;
    configure_site | cs)
        configure_site "$2" "$3"
    ;;
esac