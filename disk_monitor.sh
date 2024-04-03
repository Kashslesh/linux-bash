diskSpace=$(df --output=pcent '/dev/sda3' | sed -z 's/[^0-9]*//g')
path=$(pwd)
threshold=10
if [ $diskSpace -gt $threshold ];then
    echo "Disk space almost full, $diskSpace %">> "$path/disk_log.txt"
fi