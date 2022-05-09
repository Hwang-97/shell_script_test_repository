


path="/home/ubuntu/test_git/C_Study/oracle_linux_server/"
today=$(date "+%Y%m%d")
fileName="auto_commit_${today}.c"

cmd="touch $path$fileName"

$cmd

if [ -f $path$fileName ]; then

	cd "/home/ubuntu/test_git/C_Study/"
	git add *
	git commit -m "$today auto commit"
	git push

	echo "sucsses"

else

	echo "fail"

fi

