run=$1;
name=${run%.*};
g++ -o $name $run;
if [ $? -eq 0 ]
then
	#echo "$name.cpp编译完成";
	echo '========================Runing========================'
	$name
else
	echo "有bug, 加油！！！"
fi
