while true
do
	thetime=$(date "+%M")
	thetime2=`expr $thetime + 10`
	remainder=$(($thetime2%5))
	if [ $remainder = '0' ]
	then
		cd /blog;sh gitpull.sh
		date
		sleep 60s
	else
		sleep 60s
	fi
done
