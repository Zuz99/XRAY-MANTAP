#!/bin/bash
clear
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                 INFO SERVER                \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
IPVPS=$(curl -s ipinfo.io/ip )
ISPVPS=$( curl -s ipinfo.io/org )

MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);
clear

BURIQ () {
    curl -sS https://raw.githubusercontent.com/Zuz99/permission/main/ipmini > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/Zuz99/permission/main/ipmini | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/Zuz99/permission/main/ipmini | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
#clear
if [ "$cekup" = "day" ]; then
echo -e "System Uptime   :  $uphours $upminutes $uptimecek"
else
echo -e "System Uptime   :  $uphours $upminutes"
fi
echo -e "IP-VPS          :  $IPVPS"
echo -e "ISP-VPS         :  $ISPVPS"
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                     ┃ Script By SL ┃   MOD BY Lamao                                    ║" 
echo "╚═════════════════════════════════════════════════════════════════╝"
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║ ┃ Link Script ┃  ┃ https://github.com/Locu-Locu/MANTAP-XRAY ┃          ║" 
echo "╚═════════════════════════════════════════════════════════════════╝"
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                     ┃ XRAY XMENU ┃                                         ║" 
echo "╚═════════════════════════════════════════════════════════════════╝"  
echo "║ 1. Buat Semua Akun XRAY   ┃ Create Account                       ║"
echo "║ 2. Hapus Akun XRAY        ┃ Delete Account                       ║"
echo "║ 3. Cek Nama Domain        ┃ Domain Name Checker                  ║"
echo "║ 4. Cek IP Publik          ┃ Check Public IP                      ║"
echo "║ 5. Update DLL             ┃ Update ETC                           ║"
echo "║ 6. XRAY UPDATE Core       ┃ Update Core                          ║"
echo "║ 7. XRAY UPDATE SCRIPT     ┃ Update Script                        ║"
echo "║ 8. Hidupkan Ulang Xray    ┃ Restart Service XRAY                 ║"
echo "║ 9. Perbarui Sertifikat    ┃ Update Certificate                   ║"
echo "║ 10.Tambahkan Domain       ┃ ADD DOMAIN                           ║"
echo "║ 11.CARA POINTING DOMAIN   ┃                                      ║"
echo "║ 12.Test Kecepatan Server  ┃ Speedtest Server                     ║"
echo "║ 13.Hidupkan Ulang VPS     ┃ Reboot                               ║"
echo "║ 14.Keluar Dari Menu       ┃ Exit Menu                            ║"
echo "║ 15.Info Script            ┃                                      ║"
echo "║ 16.Auto Pointing Subdomain┃                                      ║"
echo "║ 17.Cek Semua Layanan Port ┃ Check All Port Service               ║"
echo "╚═════════════════════════════════════════════════════════════════╝" 
read -p "     Select From Options [1-69 or x] :  " xmenu
case $xmenu in 
1)
add-akun
;;
2)
delete-akun
;;
3)
cat /etc/xray/domain
;;
4)
curl -s ipinfo.io/ip
;;
5)
updatedll
;;
6)
updatecore
;;
7)
updatesc
;;
8)
restart-xray
;;
9)
certv2ray
;;
10)
add-domain
;;
11)
how-pointing
;;
12)
speedtest
;;
13)
reboot
;;
14)
exit
;;
15)
cat /root/log-install.txt
;;
16)
auto-pointing
;;
17)
cek-port
;;
*)
echo "Input The Correct Number !"
;;
esac
