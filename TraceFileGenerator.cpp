#include<iostream>
#include <cmath>
using namespace std;

int main()
{
	int a = pow(2,8)-1;
	int i,j,k,l,I,J;
	int p;
	int bin1[8] = {0,0,0,0,0,0,0,0};
	int bin2[8] = {0,0,0,0,0,0,0,0};
	int bin3[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

	for(i=0;i<=a;i++)
	{

		for(j=0;j<=a;j++)
		{
			p=i*j;
			I=i; J=j;
 			
			for(l=0;l<8;l++)
			{	
				//cout<<j<<endl;

				bin1[l]=(I%2);
				I/=2;
				bin2[l]=(J%2);
				J/=2;
				
			}

			for(l=0;l<16;l++)
			{
				bin3[l]=(p%2);
				p/=2;
			}

			for(k=7; k>=0; k--)
			{
				cout<<bin1[k];
			}

			cout<<" ";
			for(k=7; k>=0; k--)
			{
				cout<<bin2[k];
			}

			cout<<" ";
			for(k=15; k>=0; k--)
			{
				cout<<bin3[k];
			}

			cout<<endl;
		}
	}

	return 0;
}