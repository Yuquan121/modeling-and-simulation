function [p]=snr2pb(snr_in_dB)
% [p]= snr2pb (snr_in_dB)
%本函数的功能是已知信噪比，返回误码率结果		
N=10000;
Eb=1;
d=1;				  
snr=10^(snr_in_dB/10);	 	  	%信噪比
sgma=sqrt(Eb/(2*snr));	  	  	%计算噪声均方根
phi=0;                                                                  %假设信道相移φ=0
%生成输入数据
for i=1:N,	
  temp=rand;			  	%产生0~1之间的均匀随机变量
  if (temp<0.5),
    dsource(i)=0;
  else
    dsource(i)=1;
  end;
end;
% 检测并计算误码率
numoferr=0;
for i=1:N,
  %解调器输出
  if (dsource(i)==0),
    r0c=sqrt(Eb)*cos(phi)+bmgauss(sgma);
    r0s=sqrt(Eb)*sin(phi)+bmgauss(sgma);
    r1c=bmgauss(sgma);
    r1s=bmgauss(sgma);
  else
    r0c=bmgauss(sgma);
    r0s=bmgauss(sgma);
    r1c=sqrt(Eb)*cos(phi)+bmgauss(sgma);
    r1s=sqrt(Eb)*sin(phi)+bmgauss(sgma);
  end;
  %平方律检测输出
  r0=r0c^2+r0s^2;
  r1=r1c^2+r1s^2;
  % 判决
  if (r0>r1),
    decis=0;
  else
    decis=1;
  end;
  %如果检测结果不正确，误码计数器加1.
  if (decis~=dsource(i)),
    numoferr=numoferr+1;
  end;
end;
p=numoferr/(N);		  
