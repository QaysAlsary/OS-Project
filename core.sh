#!/bin/bash
insert() {
read -p "Enter the Key: " key;
 result=$(grep -oh "\w*$key :\w*" $dbname)
 #grep -oh "\w*$key :\w*" $dbname
 if [ "$key :" == "$result" ];
 then
 echo "Key must be unique"
 #echo $result
 else
read -p "Enter the value: " ucvalue;
value=`echo -n $ucvalue | base64`
echo >> $dbname "version 1 " $USERNAME
echo >> $dbname $key : $value
fi
}
search() {
read -p "Enter the Key: " key;
#reslut=`echo database1.txt | grep -w "$key :" `
 #grep -w "$key :" database1.txt 
 result=$(grep -w "$key :" $dbname)

#result2=$(cut --complement -d ":" -f 1 $result)
result2=$(echo $result |cut --complement -d ":" -f 1)
result3=`echo -n $result2 | base64 -d`
#result=$(grep -w "$key :" database1.txt)
#result2=$(echo $result |cut --complement -d ":" -f 1)
echo result : $result
echo reslut2 : $result3
}
delete() {
read -p "Enter the Key: " key;
sed -i "/^$key/d" $dbname
}
update() {
read -p "Enter the Key: " key;
read -p "Enter the new Value: " value;
nvalue=`echo -n $value | base64`
result=$(grep -w "$key :" $dbname)
result2=$(echo $result |cut --complement -d ":" -f 1)
sed -i "s/$result2/ $nvalue/g" $dbname
}
