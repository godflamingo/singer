#!/bin/sh
# Install V2/X2 binary and decompress binary
mkdir /tmp/sing
curl --retry 10 --retry-max-time 60 -L -H "Cache-Control: no-cache" -fsSL github.com/SagerNet/sing-box/releases/download/v1.0.4/sing-box_1.0.4_linux_amd64.deb -o /tmp/sing/sing-box_1.0.4_linux_amd64.deb
busybox dpkg -i sing-box_1.0.4_linux_amd64.deb
busybox dpkg -c sing-box_1.0.4_linux_amd64.deb
rm -rf /tmp/sing
cat << EOF > /etc/sing-box/config.json
{
  "inbounds": [
    {
      "type": "shadowtls",
      "listen_port": 443,
      "handshake": {
        "server": "www.bing.com",
        "server_port": 443 
      },
      "detour": "shadowsocks-in"
    },
    {
      "type": "shadowsocks",
      "tag": "shadowsocks-in",
      "listen": "127.0.0.1",
      "method": "2022-blake3-aes-128-gcm",
      "password": "8JCsPssfgS8tiRwiMlhARg=="
    }
  ]
}
EOF
# Let's get start
#tor & /usr/bin/sing-box run run -c /etc/sing-box/config.json
