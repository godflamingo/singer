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
      "type": "trojan",
      "tag": "trojan-in",
      "listen": "127.0.0.1",
      "listen_port": 52001,
      "tcp_fast_open": true,
      "udp_fragment": true,
      "sniff": true,
      "sniff_override_destination": false,
      "udp_timeout": 300,
      "proxy_protocol": true,
      "proxy_protocol_accept_no_header": false,
      "users": [
        {
          "name": "imlala",
          "password": "password"
        }
      ],
      "tls": {
        "enabled": true,
        "server_name": "trojan-websocket.example.com",
        "alpn": [
          "http/1.1"
        ],
        "min_version": "1.2",
        "max_version": "1.3",
        "acme": {
          "domain": ["trojan-websocket.example.com"],
          "data_directory": "/usr/local/etc/sing-box",
          "default_server_name": "",
          "email": "imlala@example.com",
          "provider": "letsencrypt"
        } 
      },
      "transport": {
        "type": "ws",
        "path": "/debian",
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
