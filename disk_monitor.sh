diskSpace=$(df --output=pcent '/dev/sda3' | sed -z 's/[^0-9]*//g')
path=$(pwd)
threshold=10
echo "$path"
echo "Disk space almost full, $diskSpace %">> "$path/disk_log.txt"
if [ $diskSpace -gt $threshold ];then
    echo "Disk space almost full, $diskSpace %">> "$path/disk_log.txt"
fi