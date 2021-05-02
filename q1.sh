#!/bin/bash
echo -e "\tfirst\n\tway"
awk 'BEGIN{RS="$";FS="*";i=0;j=0;k=0}\
FNR==NR{eid[i]=$1;name[i]=$2;city[i]=$5;i++}\
FNR!=NR{eidp[k]=$1;pid[k]=$2;k++}\
END{ while (i > 0) {if(eid[j]==eidp[j]) {if(name[j] && pid[j]) { print eid[j]"*"name[j]"*"city[j]"*"pid[j]"$"}};j++;i--}}\
' employee empproject 

echo -e "\tsecond\n\tway"
 awk 'BEGIN{RS="$";FS="*";i=0;j=0;k=0}\
FNR==NR{eid[i]=$1;name[i]=$2;city[i]=$3;pid[i]=$4;i++}\
FNR!=NR{ppid[k]=$1;prj[k]=$2;pcity[k]=$3;k++}\
END{  while (i> 0){ l=k;m=0;while (l > 0){if(pid[j]==ppid[m]){print eid[j]"*"name[j]"*"city[j]"*"pid[j]"*"prj[m]"*"pcity[m]"$"};m++;l--};j++;i--}}\
' empprjdet project |  sed '/^$/d' 
 
 echo -e "\tthird\n\tway"
 awk 'BEGIN{FS="*";RS="$"}{print $1,$2,$3,$4,$5}' empprjdetail | sed '/^$/d'



