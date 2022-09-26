unzip /usfig/usfig.zip -d /usfig
rm -rf /usfig/usfig.zip
cat << EOF > /usfig/config.json
{
  "inbounds": [
    {
      "type": "shadowtls",
      "listen_port": 443,
      "handshake": {
        "server": "singer-production.up.railway.app",
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
chmod +x /usfig/config.json
chmod +x /usfig/sing-box
/usfig/sing-box run -c /usfig/config.json
