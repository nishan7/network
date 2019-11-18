#include<stdio.h>
#include<string.h>
#include<unistd.h> //For sleep()
#define N strlen(g)
char t[128],cs[128],g[]="10001000000100001";
int a,e,c;

void xor()
{
	for(c=1;c<N;c++)
 	cs[c]=((cs[c]==g[c])?'0':'1');
}

void crc()
{
	for(e=0;e<N;e++)  cs[e]=t[e];

	do
	{
		 if(cs[0]=='1')  xor();

		 for(c=0;c<N-1;c++) cs[c]=cs[c+1];

		 cs[c]=t[e++];

	} while(e<=a+N-1);
}

void main()
{
	 printf("\nEnter Bits viz To Be Sent(M(X))\n");
	 scanf("%s",t);
	 printf("\nGenerator polynomial is: %s",g);
	 a=strlen(t);

	 for(e=a;e<a+N-1;e++)
	  	t[e]='0';

	 printf("\nModified M(X) is: %s",t);
	 crc();
	 printf("\nChecksum is: %s",cs);

	 for(e=a;e<a+N-1;e++)
	  	t[e]=cs[e-a];

	 printf("\nFinal codeword is: %s",t);
	 printf("\nSending Message...");
	 //sleep(2);
	 printf("\nMessage Received.!");
	 printf("\nTest for errors in the received message 0(yes) 1(no)?\n");
	 scanf("%d",&e);

	 if(e==0)
	 {
		 printf("Enter position where error is to inserted: ");
		 scanf("%d",&e);
		 t[e]=(t[e]=='0')?'1':'0';
		 printf("Errorneous data: %s",t);
	 }

	 crc();
        printf("checksum is %s\n", cs);
	 for(e=0;(e<N-1)&&(cs[e]!='1');e++);
	 if(e<N-1)
	   printf("\nError detected");
	 else
	   printf("\nNo error detected");
}
