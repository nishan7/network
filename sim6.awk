BEGIN{
count=0
}

{
if($1=="c")
   count++;
}
   
END{
printf("Total packet collision %d",count);
}   
