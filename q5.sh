#!/bin/bash
awk 'BEGIN{RS="$";FS="*";i=0;j=0}$3!=$6{print $1,$2}' empprjdetail | sed '/^$/d'
