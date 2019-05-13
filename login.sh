ni="eth3"		#获取到内网ip的网络接口
url="172.31.1.2"
account=""
password="123456"

login( ){
ip=$(ifconfig $nic |grep "inet addr"| cut -f 2 -d ":"|cut -f 1 -d " ")
url1="http://${url_ip}:801/eportal/?c=ACSetting&a=Login&protocol=http:&hostname=172.31.1.2&iTermType=1&wlanuserip="
url2="&wlanacip=null&wlanacname=null&mac=00-00-00-00-00-00&ip="
url3="&enAdvert=0&queryACIP=0&loginMethod=1"
post_url="${url1}${ip}${url2}${ip}${url3}"
#echo $ip
#echo $post_url
curl -d "DDDDD=,0,${account}&upass=${password}&R1=0&R2=0&R3=0&R6=0?=00&0MKKey=123456"  ${post_url}
}
login

while true;do
	if [ $(ping -c 1 -w 1 114.114.114.114 | grep "received" | cut -d " " -f 4) == "0" ];then
		login
		#echo "[-]connecting!"
	else
		#echo "[+]logined!"
		sleep 2s
	fi
done
