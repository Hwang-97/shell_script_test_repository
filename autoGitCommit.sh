


path="/home/ubuntu/test_git/C_Study/oracle_linux_server/"
today=$(date "+%Y%m%d")
fileName="auto_commit_${today}.c"
txt="

#include<stdio.h>

void main(){
	printf(\"   $today auto commit!!   \");
}

"
cmd="touch $path$fileName"

$cmd

if [ -f $path$fileName ]; then

	echo "$txt" > $path$fileName
	gcc $path$fileName -o "${path}auto_commit_${today}"
        
	cd "/home/ubuntu/test_git/C_Study/"
	git add *
	git commit -m "$today auto commit"
	git push
	
	chmod 777 $path$fileName
	echo "`${path}./auto_commit_${today}` >>> sucsses"

else

	echo "fail"

fi

