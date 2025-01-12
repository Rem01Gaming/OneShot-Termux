**Disclaimer**: I am not responsible for what you do with this tool or this information. The use of this tool should only be attempted on networks you own or have permission to test. please use this tool wisely.

# OneShot Termux
OneShot Termux - Implementation of  [OneShot](https://github.com/drygdryg/OneShot) on Termux with DEB package

WiFi pentesting tool that allows to run WPS PIN attacks ([Pixie Dust](https://forums.kali.org/showthread.php?24286-WPS-Pixie-Dust-Attack-Offline-WPS-Attack) and bruteforce) without monitor mode with wpa_supplicant.

## Features
- [Pixie Dust attack](https://forums.kali.org/showthread.php?24286-WPS-Pixie-Dust-Attack-Offline-WPS-Attack);
- integrated [3WiFi offline WPS PIN generator](https://3wifi.stascorp.com/wpspin);
- [online WPS bruteforce](https://sviehb.files.wordpress.com/2011/12/viehboeck_wps.pdf);
- Wi-Fi scanner with highlighting based on iw;

## Requirements
- An Android device with Termux installed
- Root Access
- Working brain with minimal cli knowledge 🧠 

## Installation
```shell
apt update -y && apt upgrade -y
apt install wget root-repo openssl -y
wget https://github.com/Rem01Gaming/OneShot-Termux/releases/download/v1.0.1/oneshot.deb
apt install ./oneshot.deb
```

## Usage
```yaml
OneShotPin 0.0.2 (c) 2017 rofl0r, moded by drygdryg
oneshot <arguments>

Required arguments:
    -i, --interface=<wlan0>  : Name of the interface to use

Optional arguments:
    -b, --bssid=<mac>        : BSSID of the target AP
    -p, --pin=<wps pin>      : Use the specified pin (arbitrary string or 4/8 digit pin)
    -K, --pixie-dust         : Run Pixie Dust attack
    -B, --bruteforce         : Run online bruteforce attack

Advanced arguments:
    -d, --delay=<n>          : Set the delay between pin attempts [0]
    -w, --write              : Write AP credentials to the file on success
    -F, --pixie-force        : Run Pixiewps with --force option (bruteforce full range)
    -X, --show-pixie-cmd     : Always print Pixiewps command
    --vuln-list=<filename>   : Use custom file with vulnerable devices list ['vulnwsc.txt']
    --iface-down             : Down network interface when the work is finished
    -l, --loop               : Run in a loop
    -v, --verbose            : Verbose output
    -m, --mtk-fix            : MTK interface fix, turn off Wi-Fi to use this
    -r, --reverse-scan       : Reverse sorting of networks in the scan. Useful on small displays
```

### Usage Examples
#### Start Pixie Dust attack on a specified BSSID:
```shell
sudo oneshot -i wlan0 -b 00:90:4C:C1:AC:21 -K
```
#### Show avaliable networks and start Pixie Dust attack on a specified network:
```shell
sudo oneshot -i wlan0 -K
```

## Troubleshooting
### "RTNETLINK answers: Operation not possible due to RF-kill"
 Just run:
```shell
sudo rfkill unblock wifi
```
### "Device or resource busy (-16)"
Try disabling Wi-Fi in the system settings. Alternatively, you can try running OneShot with ```--iface-down``` argument.

## Acknowledgements
Credits to contributor on this tool, the only thing I done is implementing this tool to Termux just like lego pieces :D
### Special Thanks
* `rofl0r` for initial implementation;
* `Monohrom` for testing, help in catching bugs, some ideas;
* `Wiire` for developing Pixiewps.
* Other contributors on the tool development
