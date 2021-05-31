#!/bin/sh

/server add libera irc.libera.chat/6667 -autoconnect
/set irc.server.libera.nicks afify
/connect libera

openssl ecparam -genkey -name prime256v1 -out ~/.weechat/ecdsa.pem
openssl ec -noout -text -conv_form compressed -in ~/.weechat/ecdsa.pem | grep '^pub:' -A 3 | tail -n 3 | tr -d ' \n:' | xxd -r -p | base64

/msg NickServ IDENTIFY
/msg nickserv set pubkey AqiokYOwutN60SSviH1itTwPeNnqcCLY+wHsNg4HEu7V
/set irc.server.libera.sasl_mechanism ecdsa-nist256p-challenge
/set irc.server.libera.sasl_username "afify"
/set irc.server.libera.sasl_key "%h/ecdsa.pem"
/reconnect libera

/set irc.server.libera.addresses "libera75jm6of4wxpxt4aynol3xjmbtxgfyjpu34ss4d7r7q2v5zrpyd.onion"
/proxy add tor socks5 127.0.0.1 9050
/set irc.server.libera.proxy "tor"
/set irc.server.libera.ssl_verify off
/reconnect libera

/set irc.server_default.username "afify"
/set irc.server_default.realname "afify"
/set irc.server_default.msg_part ""
/set irc.server_default.msg_quit ""
/set irc.ctcp.clientinfo ""
/set irc.ctcp.finger ""
/set irc.ctcp.source ""
/set irc.ctcp.time ""
/set irc.ctcp.userinfo ""
/set irc.ctcp.version ""
/set irc.ctcp.ping ""
/plugin unload xfer
/set weechat.plugin.autoload "*,!xfer"
/save
/reconnect libera

# became operator
/msg chanserv op #sfm afify
/msg Chanserv set #sfm guard on
/mode #sfm
/msg chanserv info #sfm
/join #libera-cloak
/msg #libera-cloak !cloakme
