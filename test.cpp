#include <hls_stream.h>
#include <ap_axi_sdata.h>

using namespace std;

typedef ap_axis<32,2,5,6> int_side_ch;

void gcdfunction(hls:: stream<int_side_ch> &inStream , hls:: stream<int_side_ch> &outStream, int gain);

int main()
{
	hls:: stream<int_side_ch> inputStream;
	hls:: stream<int_side_ch> outputStream;
	int arr[2]={68,119};

	for (int i=0; i<2; i++)
	{
		int_side_ch val_in;
		int dt;
		//cout<<"\nEnter number "<<i+1<<": ";
		//cin>>dt;
		val_in.data=arr[i];
		val_in.keep=1;
		val_in.strb=1;
		if(i==1)
		val_in.last=1;
		else
		val_in.last=0;
		val_in.user=1;
		val_in.id=0;
		val_in.dest=0;

		inputStream<<val_in;
	}

	gcdfunction(inputStream, outputStream, 1);

	
		int_side_ch val_out;
		outputStream.read(val_out);
		cout<<"\n gcd output val = "<< val_out.data;

	


}
