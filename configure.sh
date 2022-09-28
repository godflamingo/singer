unzip /usfig/usfig.zip -d /usfig
rm -rf /usfig/usfig.zip
chmod +x /usfig/sing-box
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
      "transport": {
        "type": "ws",
        "path": "/app"
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
chmod +x /etc/sing-box/config.json
# Let's get start
/usfig/sing-box run -c /etc/sing-box/config.json
