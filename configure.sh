#!/bin/sh
unzip /usfig/usfig.zip -d /usfig
rm -rf /usfig/usfig.zip
mkdir /etc/sing-box
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
chmod +x /usfig/singbox
chmod +x /etc/sing-box/config.json
# Let's get start
tor & /usfig/singbox run -c /etc/sing-box/config.json
