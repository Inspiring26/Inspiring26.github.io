while true
do
	thetime=$(date "+%M")
	remainder=$((($thetime+10)%5))
	if [ $remainder = '0' ]
	then
		cd ~/blog;sh gitpull.sh
		date
		sleep 60s
	else
		sleep 60s
	fi
done
