#!/bin/bash
send_telegram_message() {
    local message="$1"
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_API_TOKEN/sendMessage" \
        -d chat_id="$TELEGRAM_CHAT_ID" \
        -d text="$message" >/dev/null
}

# Add variables
log_file=/root/memeland_auto_reger/log_file.log

# Add Telegram variables
. ~/.bash_profile
if [ -z $TELEGRAM_API_TOKEN ]; then
  read -p -r 'Your TELEGRAM API TOKEN. Example "826405938:djhNkduNekj4njmfjJJJDHkjdsJ732349kjdfD": ' TELEGRAM_API_TOKEN
  echo 'export TELEGRAM_API_TOKEN='$TELEGRAM_API_TOKEN >> $HOME/.bash_profile
  . ~/.bash_profile
fi

if [ -z $TELEGRAM_CHAT_ID  ]; then
  read -p -r 'Your TELEGRAM CHAT ID. Example "947265947": ' TELEGRAM_CHAT_ID
  echo 'export TELEGRAM_CHAT_ID='$TELEGRAM_CHAT_ID >> $HOME/.bash_profile
  . ~/.bash_profile
fi


# For telegram alerting
tail -F ${log_file} | while read -r line_log; do
	if echo "$line_log" | grep -q ERROR ; then
		send_telegram_message "$line_log"
	fi
done
