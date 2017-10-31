#!/bin/bash 

val1=10 
val2=11

if test $val1 -gt 5
then 
echo "The test value $val1 is greater than 5" 
fi

if [ $val1 -eq $val2 ]
then 
echo "The vaules are equal" 
else 
echo "The values are different" 
fi

LOGGING_FILE=/d/projects/spring-boot-admin/target/logs/spring-boot-admin.log

if [ -d $LOGGING_FILE ] && [ -w $LOGGING_FILE ]
then
echo "This is a writeable directory!"
else
echo "This is a file!!"
fi

regex="[A-Za-z0-9]{6}"
echo $BASH_SOURCE
if [ $1=~$regex ]
then 
 echo $1
else
 echo "Invaild entry!"
fi

