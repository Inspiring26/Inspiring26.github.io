while true
do
	thetime=$(date "+%M")
	remainder=$(($thetime%10))
	if [ $remainder = '0' ]
	then
		git pull
	else
		sleep 60s
	fi
done
