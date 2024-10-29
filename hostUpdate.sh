#!/bin/zsh
rootPass="填写root密码"
begin=$(grep -n "# fetch-github-hosts begin" /etc/hosts|awk -F: '{print $1}')
end=$(grep -n "# fetch-github-hosts end" /etc/hosts|awk -F: '{print $1}')
echo "[INFO] Removing old hosts. Start at line \"${begin}\", End at line \"${end}\""
if [ ! -z "$end" ] || [ ! -z "$start" ]; then
    let end=$end+1
    echo $rootPass |sudo -S sed -i '' "${begin},${end}d" /etc/hosts
fi
echo $rootPass |sudo -S zsh -c  "curl https://hosts.gitcdn.top/hosts.txt >> /etc/hosts"