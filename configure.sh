#!/bin/sh
unzip /usfig/usfig.zip -d /usfig
rm -rf /usfig/usfig.zip
mkdir /etc/sing-box
cat << EOF > /etc/sing-box/config.json
{
  "inbounds": [
    {
      "type": "vmess",
      "tag": "vmess-in",
      "listen": "0.0.0.0",
      "listen_port": 23323,
      "users": [
        {
          "name": "imlala",
          "uuid": "54f87cfd-6c03-45ef-bb3d-9fdacec80a9a",
          "alterId": 0
        }
      ],
      "tls": {},
	  "set_system_proxy": false,
      "transport": {
        "type": "ws",
        "path": "/app"
      }
    }
  ]
}
EOF
chmod +x /usfig/singbox
chmod +x /etc/sing-box/config.json
# Let's get start
/usfig/singbox run -c /etc/sing-box/config.json
