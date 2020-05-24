while true
do
	thetime=$(date "+%M")
	remainder=$(($thetime%5))
	if [ $remainder = '0' ]
	then
		cd ~/blog;git pull
	else
		sleep 60s
	fi
done
