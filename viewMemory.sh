
hn=`hostname`
#total        used        free      shared  buff/cache   available
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
	echo "userd % : $totalMemory/$usedMemory"#숫자로 변경해야 됨
	echo "============= END ============="
    echo ""
	sleep $1
done	
