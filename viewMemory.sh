#파라미터 지정이 필요

 
 

#total        used        free      shared  buff/cache   available
NOW=$(date +"%y-%m-%d %T")
echo "[$NOW] viewMemory.sh started." >> viewMemory.log 2>&1
standard=$2
hn=`hostname`
while [ 1 ]
do
	echo "============ START ============"
	echo "[ $hn ]"
	echo ""
	echo sudo | free -m | awk '{if($1=="Mem:" || $1=="total") print $0}'
	totalMemory=`echo sudo | free -m | awk '{if($1=="Mem:") print $2}'`
	usedMemory=`echo sudo | free -m | awk '{if($1=="Mem:") print $3}'`
	echo "totalMemory = $totalMemory"
	echo "usedMemory = $usedMemory"
	result=`echo "scale=2;$usedMemory/$totalMemory*100"|bc`
	result=`expr $result`
	standard=`expr $standard`
	echo "using % : $result%" 
	NOW=$(date +"%y-%m-%d %T")
	
	if [ `echo "$result < $standard" | bc` -eq 1 ] ;
	then	
		echo "[$NOW] using $standard% Excess" >> viewMemory.log 2>&1
		echo "using $standard% Excess"	
	else
		echo "[$NOW] Normal operation" >> viewMemory.log 2>&1
		echo "Normal operation"	
	fi

	echo "============= END ============="
    echo ""
	sleep $1
done

NOW=$(date +"%y-%m-%d %T")
echo "[$NOW] viewMemory.sh End." >> viewMemory.log 2>&1


