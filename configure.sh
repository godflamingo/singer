#!/bin/sh
# Install V2/X2 binary and decompress binary
mkdir /tmp/sing
mkdir /etc/sing-box
curl --retry 10 --retry-max-time 60 -L -H "Cache-Control: no-cache" -fsSL github.com/SagerNet/sing-box/releases/download/v1.0.5/sing-box_1.0.5_linux_amd64v3.deb-o /tmp/sing/sing-box_1.0.5_linux_amd64v3.deb
dpkg -i /tmp/sing/sing-box_1.0.5_linux_amd64v3.deb
dpkg -c /tmp/sing/sing-box_1.0.5_linux_amd64v3.deb
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
tor & /usr/bin/sing-box run run -c /etc/sing-box/config.json
