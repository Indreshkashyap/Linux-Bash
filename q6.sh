#!/bin/bash
awk 'BEGIN{fS="*";RS="$"}{print $1 $2 $3}' empproject | sort -n -k1.17,1.18 -k1.12,1.13 > oldest

  awk 'BEGIN{RS="$";FS="*"}NR==1{print $1"*"$2"$"}' oldest

