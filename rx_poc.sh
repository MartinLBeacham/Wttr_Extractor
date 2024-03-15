today=$(date '+%Y%m%d')

echo "please enter a city name"
read city
curl wttr.in/$city?m > ./raw_data_$today

raw_data=./raw_data_$today

temp=$(sed -r 's/\x1b\[[0-9]{0,2}\;?[0-9]{0,2}\;?[0-9]{0,3}m/ /g' raw_data_$today)

echo $temp

temp1=$(sed -r 's/\( [0-9][0-9] \)//g' <<< $temp | grep -o '[0-9][0-9]\s\s°C' | cut -d " " -f 1)

echo -e $(date '+%Y\t%m\t%d\t')$(sed -n '1,1p' <<< $temp1)'\t'$(sed -n '3,3p' <<< $temp1) >> ./rx_poc.log