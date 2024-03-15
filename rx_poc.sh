today=$(date '+%Y%m%d')

curl wttr.in/casablanca?m > ./raw_data_$today

raw_data=./raw_data_$today

temp=$(sed -r 's/\x1b\[[0-9]{0,2}\;?[0-9]{0,2}\;?[0-9]{0,3}m/ /g' raw_data_$today)

echo $temp

sed -r 's/\( [0-9][0-9] \)//g' <<< $temp | grep -o '[0-9][0-9]\s\s°C' | cut -d " " -f 1 > test.txt

echo -e $(date '+%Y\t%m\t%d\t')$(sed -n '1,1p' test.txt)'\t'$(sed -n '3,3p' test.txt) >> ./rx_poc.log