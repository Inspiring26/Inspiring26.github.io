while true
do
	thetime=$(date "+%M")
	remainder=$(($thetime%5))
	if [ $remainder = '0' ]
	then
		cd ~/blog;sh gitpull.sh
	else
		sleep 60s
	fi
done
