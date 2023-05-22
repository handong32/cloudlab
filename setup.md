dnf makecache --refresh
dnf -y install cpuid msr-tools libcap-devel NetworkManager

systemctl start tuned
tuned-adm profile powersave
tuned-adm list

systemctl unmask NetworkManager.service
systemctl start NetworkManager

nmcli con show

dnf -y install netperf

dnf -y install cpupowerutils
