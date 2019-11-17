BEGIN{
count=0;
}

{
if($1=="d")
count++
}

END{
printf("the total number of packets dropped due to congestion:%d\n",count);
}
