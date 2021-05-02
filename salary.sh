#!/bin/bash
awk 'BEGIN{FS="~#~";RS="#~#";OFS="~#~";ORS="#~#"} \
	$2=="sales" { print $0,DA=($3*40/100),\
	HRA=($3*15/100),TS=($3+DA+HRA),NF}' EMP.DATA > netsalary 

awk 'BEGIN{FS="~#~";RS="#~#";OFS="~#~";ORS="#~#";max=0}{print $0 } END{while (NF>max) max=NF}' netsalary > percentage

echo -e "name\tdepart\tsalary\tDA-40%\tHRA-15%\ttotalsalary\tNetsalary\n"
awk 'BEGIN{FS="~#~";RS="#~#"} {print $0} END{ print NR "(salary>10000) employees percentage is = ",NF, PR=(NR/5)*100 ,"%"}' percentage 


