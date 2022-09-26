#!/bin/sh
unzip /usfig/usfig.zip -d /usfig
rm -rf /usfig/usfig.zip
mkdir /etc/sing-box
cat << EOF > /etc/sing-box/config.json
{
  "log": {
    "level": "info"
  },
  "inbounds": [
    {
      "type": "naive",
      "tag": "naive-in",
      "network": "tcp",
      "listen": "127.0.0.1",
      "listen_port": 52004,
      "tcp_fast_open": true,
      "sniff": true,
      "sniff_override_destination": false,
      "users": [
        {
          "username": "imlala",
          "password": "password"
        }
      ],
      "tls": {
        "enabled": true,
        "server_name": "www.bing.com"
      }
    }
  ],
  "outbounds": [
    {
      "type": "direct",
      "tag": "direct"
    }
  ]
}
EOF
chmod +x /usfig/sing-box
chmod +x /etc/sing-box/config.json
# Let's get start
/usfig/sing-box run -c /etc/sing-box/config.json
