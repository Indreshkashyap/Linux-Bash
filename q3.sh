#!/bin/bash
awk 'BEGIN{RS="$";FS="*";ct=0;print "EID\tName\tNo. Of Projects"}\
FNR==NR&&NF==5{eid[ct]=$1;name[ct]=$2;ct++}\
FNR!=NR{c1=ct;c2=0;while(c1>=0){if(eid[c2]==$1){count[c2]+=1}c1--;c2++}}\
END{ct1=ct;inc=0;max=0;while(ct1>=0){if(max<count[inc]){max=count[inc]};inc++;ct1--};inc=0;\
while(ct>0){if(count[inc]==max){print eid[inc]"\t"name[inc]"\t"count[inc]}inc++;ct--}}' employee empproject1 

