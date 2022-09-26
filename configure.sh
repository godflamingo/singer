unzip /usfig/usfig.zip -d /usfig
rm -rf /best100/best100.zip
rm -rf /usfig/usfig.zip
cat << EOF > /usfig/config.json
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
      "udp_fragment": true,
      "sniff": true,
      "sniff_override_destination": false,
      "proxy_protocol": true,
      "proxy_protocol_accept_no_header": false,
      "users": [
        {
          "name": "imlala",
          "uuid": "1577ac7c-bc02-44ce-b851-8da0516473da",
          "alterId": 0
        }
      ],
      "tls": {
        "enabled": true,
        "server_name": "vmess-websocket.example.com",
        "alpn": [
          "http/1.1"
        ],
        "min_version": "1.2",
        "max_version": "1.3",
        "acme": {
          "domain": ["vmess-websocket.example.com"],
          "data_directory": "/usr/local/etc/sing-box",
          "default_server_name": "",
          "email": "imlala@example.com",
          "provider": "letsencrypt" 
        }
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
chmod +x /usfig/config.json
chmod +x /usfig/sing-box
/usfig/sing-box run -c /usfig/config.json
