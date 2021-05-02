#!/bin/bash
awk 'BEGIN{RS="$";FS="*";i=0;j=0;k=0;m=0;max=0}\
FNR==NR{if(NF==3){prj[i]=$2;i++}}\
FNR!=NR{if(NF==6){empid[j]=$1;empp[j]=$5;j++}}END{while(j>0){m=i;n=0;while(m >= 0) { if(empp[k]==prj[n]){ct[n]+=1};n++;m--};k++;j--}\
ctr=0;print "Project Name\tNumber of Employees";while(ctr < 3){if(max<ct[ctr]){max=ct[ctr]};ctr++}ctr=0;while(ctr < 3){if(max==ct[ctr]){print prj[ctr]"\t\t\t"ct[ctr]}ctr++}}\
   ' project empprjdetail

