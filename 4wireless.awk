BEGIN{
count1=0
count2=0
pack1=0
pack2=0
time1=0
time2=0
}

{
if($1=="r"&&$3=="_1_"&&$4=="AGT")
{
  count1++
  pack1=pack1+$8
  time1=$2
}
if($1=="r"&&$3=="_3_"&&$4=="AGT")
{
  count2++
  pack2=pack2+$8
  time2=$2
}
}

END{
printf("Throughput from n0 to n1 %fMbps\n",((count1*pack1*8)/(time1*1000000)))
printf("Throughput from n2 to n3 %fMbps\n",((count2*pack2*8)/(time2*1000000)))
}
