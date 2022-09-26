unzip /usfig/usfig.zip -d /usfig
rm -rf /usfig/usfig.zip
cat << EOF > /usfig/config.json
{
 "inbounds": [
    {
      "port": 23323,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "65f87cfd-6c03-45ef-bb3d-9fdacec80a9a",
            "alterId": 0
          }
        ],
        "disableInsecureEncryption": true
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": "/ape"
        }
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF
chmod +x /usfig/config.json
chmod +x /usfig/sing-box
/usfig/sing-box run -c /usfig/config.json
