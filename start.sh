#!/bin/bash
echo "#########################################################"
echo "Update Advanced Packaging Tool"
echo "#########################################################"
sudo apt update&&


echo "#########################################################"
echo "Install Docker.io"
echo "#########################################################"
sudo apt install docker.io&&


echo "#########################################################"
echo "Pulling at git repository"
echo "#########################################################"
git clone https://github.com/MarshmallowBox/nodejsweb&&
cd nodejsweb&&


echo "#########################################################"
echo "Build docker....  [nodejsweb]"
echo "#########################################################"
sudo docker build -t nodejsweb .&&


echo "#########################################################"
echo "Docker Run in background  [nodejsweb]"
echo "#########################################################"
sudo docker run -d -p 80:80 --name nodejsweb nodejsweb&&
sudo apt install net-tools&&
ifconfig


echo "#########################################################"
echo -n "Choose Interface: "
read word


echo "#########################################################"
echo "Docker Run in background  [jasonish/suricata:latest]"
echo "Wait 20 Second for booting suricata"
echo "#########################################################"
sudo docker run --name suricata -d --net=host \
--cap-add=net_admin --cap-add=sys_nice \
jasonish/suricata:latest -i ${word}&&
sleep 20&&


echo "#########################################################"
echo "Setting suricata.rules  [jasonish/suricata:latest]"
echo "#########################################################"
sudo docker exec suricata bash -c "echo "alert icmp any any -> any any (msg: "icmp"; sid:10002;)">/var/lib/suricata/rules/suricata.rules"&& echo "alert http any any -> any any (msg: "http"; sid:10003;)>>/var/lib/suricata/rules/suricata.rules"; echo "alert tcp any any -> any any (msg: "tcp"; sid:10004;)>>/var/lib/suricata/rules/suricata.rules";"&&
docker restart suricata




