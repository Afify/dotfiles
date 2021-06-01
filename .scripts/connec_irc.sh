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

/msg nickserv set enforce on
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
/msg chanserv register #sfm
/msg chanserv set #sfm guard on
/mode #sfm +b $j:#wikimedia-bans
/msg chanserv flags #sfm *!*@libera/staff/* +Aiotvr
/msg chanserv flags #sfm

/msg chanserv op #sfm afify
/msg Chanserv set #sfm guard on
/mode #sfm
/msg chanserv info #sfm
/join #libera-cloak
/msg #libera-cloak !cloakme

#theme
/set aspell.color.misspelled "161"
/set aspell.color.suggestions "118"
/set irc.color.input_nick "166"
/set irc.color.item_away "11"
/set irc.color.item_channel_modes "default"
/set irc.color.item_lag_counting "default"
/set irc.color.item_lag_finished "11"
/set irc.color.message_join "118"
/set irc.color.message_quit "161"
/set irc.color.mirc_remap "1,-1:darkgray"
/set irc.color.nick_prefixes "q:161;a:166;o:118;h:lightmagenta;v:11;*:lightblue"
/set irc.color.notice "118"
/set irc.color.reason_quit "235"
/set irc.color.topic_new "166"
/set irc.color.topic_old "235"
/set logger.color.backlog_end "235"
/set logger.color.backlog_line "235"
/set relay.color.client "166"
/set relay.color.status_active "81"
/set relay.color.status_auth_failed "161"
/set relay.color.status_connecting "118"
/set relay.color.status_disconnected "161"
/set relay.color.status_waiting_auth "brown"
/set relay.color.text "252"
/set relay.color.text_bg "default"
/set relay.color.text_selected "white"
/set weechat.bar.input.color_bg "233"
/set weechat.bar.input.color_delim "240"
/set weechat.bar.input.color_fg "default"
/set weechat.bar.nicklist.color_bg "233"
/set weechat.bar.nicklist.color_delim "166"
/set weechat.bar.nicklist.color_fg "default"
/set weechat.bar.status.color_bg "235"
/set weechat.bar.status.color_delim "240"
/set weechat.bar.status.color_fg "default"
/set weechat.bar.title.color_bg "237"
/set weechat.bar.title.color_delim "166"
/set weechat.bar.title.color_fg "default"
/set weechat.color.bar_more "81"
/set weechat.color.chat "250"
/set weechat.color.chat_bg "default"
/set weechat.color.chat_buffer "white"
/set weechat.color.chat_channel "white"
/set weechat.color.chat_day_change "166"
/set weechat.color.chat_delimiters "241"
/set weechat.color.chat_highlight "81"
/set weechat.color.chat_highlight_bg "161"
/set weechat.color.chat_host "240"
/set weechat.color.chat_inactive_buffer "240"
/set weechat.color.chat_inactive_window "244"
/set weechat.color.chat_nick "166"
/set weechat.color.chat_nick_colors "cyan,magenta,green,brown,lightblue,lightcyan,lightmagenta,lightgreen,31,35,38,40,49,63,70,80,92,99,112,126,130,138,142,148,160,162,167,169,174,176,178,184,186,210,212,215,247"
/set weechat.color.chat_nick_offline "darkgray"
/set weechat.color.chat_nick_offline_highlight "default"
/set weechat.color.chat_nick_offline_highlight_bg "233"
/set weechat.color.chat_nick_other "166"
/set weechat.color.chat_nick_prefix "118"
/set weechat.color.chat_nick_self "166"
/set weechat.color.chat_nick_suffix "118"
/set weechat.color.chat_prefix_action "white"
/set weechat.color.chat_prefix_buffer "12"
/set weechat.color.chat_prefix_buffer_inactive_buffer "4"
/set weechat.color.chat_prefix_error "11"
/set weechat.color.chat_prefix_join "118"
/set weechat.color.chat_prefix_more "lightmagenta"
/set weechat.color.chat_prefix_network "magenta"
/set weechat.color.chat_prefix_quit "161"
/set weechat.color.chat_prefix_suffix "118"
/set weechat.color.chat_read_marker "161"
/set weechat.color.chat_read_marker_bg "default"
/set weechat.color.chat_server "135"
/set weechat.color.chat_tags "161"
/set weechat.color.chat_text_found "81"
/set weechat.color.chat_text_found_bg "233"
/set weechat.color.chat_time "default"
/set weechat.color.chat_time_delimiters "brown"
/set weechat.color.chat_value "166"
/set weechat.color.emphasized "11"
/set weechat.color.emphasized_bg "magenta"
/set weechat.color.input_actions "118"
/set weechat.color.input_text_not_found "161"
/set weechat.color.nicklist_away "243"
/set weechat.color.nicklist_group "118"
/set weechat.color.nicklist_offline "blue"
/set weechat.color.separator "237"
/set weechat.color.status_count_highlight "81"
/set weechat.color.status_count_msg "118"
/set weechat.color.status_count_other "default"
/set weechat.color.status_count_private "118"
/set weechat.color.status_data_highlight "81"
/set weechat.color.status_data_msg "161"
/set weechat.color.status_data_other "default"
/set weechat.color.status_data_private "118"
/set weechat.color.status_filter "118"
/set weechat.color.status_more "11"
/set weechat.color.status_name "white"
/set weechat.color.status_name_ssl "118"
/set weechat.color.status_number "161"
/set weechat.color.status_time "default"
/set weechat.look.buffer_time_format "${color:252}%H${color:245}%M${color:240}%S"
/set weechat.look.color_inactive_buffer "on"
/set weechat.look.color_inactive_message "on"
/set weechat.look.color_inactive_prefix "on"
/set weechat.look.color_inactive_prefix_buffer "on"
/set weechat.look.color_inactive_time "off"
/set weechat.look.color_inactive_window "on"
/set weechat.look.color_nick_offline "off"

/set weechat.bar.buflist.position top
/set weechat.bar.buflist.items "buflist"
/set weechat.look.prefix_same_nick "⤷"
/set weechat.look.prefix_error "⚠"
/set weechat.look.prefix_network "ℹ "
/set weechat.look.prefix_action "⚡"
/set weechat.look.bar_more_down "▼▼"
/set weechat.look.bar_more_left "◀◀"
/set weechat.look.bar_more_right "▶▶"
/set weechat.look.bar_more_up "▲▲"
/set weechat.look.prefix_suffix "╡"
/set weechat.look.prefix_align_max 15
/set logger.file.auto_log off
/set buflist.format.buffer_current "${color:,235}${format_buffer}"
/set buflist.format.hotlist_message "${color:7}"
