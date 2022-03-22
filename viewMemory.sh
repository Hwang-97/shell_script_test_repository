
hn=`hostname`

while [ 1 ] 
do
	echo "============ START ============"
	echo "[ $hn ]"
	echo ""
	echo sudo | free -m | awk '{if($1=="Mem:" || $1=="total") print $0}'
	echo ""
	echo "============= END ============="
        echo ""
	sleep $1
done	
