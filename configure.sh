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
      "type": "vmess",
      "tag": "vmess-in",
      "listen": "127.0.0.1",
      "listen_port": 52003,
      "tcp_fast_open": true,
      "sniff": true,
      "sniff_override_destination": false,
      "users": [
        {
          "name": "imlala",
          "uuid": "1577ac7c-bc02-44ce-b851-8da0516473da",
          "alterId": 0
        }
      ],
      "tls": {
        "enabled": true
      },
      "transport": {
        "type": "ws",
        "path": "/nixos",
        "max_early_data": 0,
        "early_data_header_name": "Sec-WebSocket-Protocol"
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
