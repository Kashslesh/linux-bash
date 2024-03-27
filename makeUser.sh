username="$1"
password="$2"
password

function createUser(){
    echo "Create a new user"
    if id "$username" &>/dev/null; then
        echo "User '$username' exist"
        exit 0
    else    
        echo "User '$username' doesnt exist"
        sudo adduser --disabled-password --gecos "" $username
        echo "User '$username' was added"
    fi
}

function setPassword(){
    echo "Add password for user"
    if [ -z "$password" ];then
        echo "Password is not correct"
        exit 0
    fi
    echo "$username:$password" | chpasswd
}
createUser
setPassword
