#!/bin/bash
#
# Get a Daily Inspirational Quote
#####################################
#
# Script Variables ####
#
quote_url=www.quotationspage.com/qotd.html
#
# Check url validity ###
#
check_url=$(wget -nv --spider $quote_url 2>&1)
#
if [[$check_url == *error404*]]
then
	echo "Bad web address"
	echo "$quote_url invalid"
	echo "Exiting script..."
exit
fi

#
# Download Web Site's Information
#
wget -o ./qotd.log -O ./qotd.html $quote_url
#
# Extract the Desired Data
#
sed 's/<[^>]*//g' ./qotd.html |
grep "$(date +%Y-%m-%d)" -A2 |
sed 's/>//g' |
sed '/&nbsp;/{n ; d}' |
gawk 'BEGIN{FS="&nbsp;"} {print $1}' |
tee ./daily_quote.txt > /dev/null
exit