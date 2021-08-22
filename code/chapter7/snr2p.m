function [pb,ps]=snr2p(snr_in_dB)
% [pb,ps]=snr2p(snr_in_dB)
%求出以dB为单位的给定信噪比的比特误码率和符号误码率
N=10000; %符号数
Es=1;				  	
snr=10^(snr_in_dB/10);	 	  	%计算信噪比的数值
sgma=sqrt(Es/(4*snr));	  	  	%计算噪声均方根
% 信号映射
s00=[1 0];
s01=[0 1];
s11=[-1 0];
s10=[0 -1];
%生成信号源
for i=1:N,	
  temp=rand;			  	%产生一个（0，1）之间的均匀随机变量
  if (temp<0.25),		  	%信源输出"00"的概率为1/4 
    dsource1(i)=0;
    dsource2(i)=0;		   
  elseif (temp<0.5),		  	%信源输出"01"的概率为1/4
    dsource1(i)=0;
    dsource2(i)=1;
  elseif (temp<0.75),	 	  	%信源输出"10"的概率为1/4
    dsource1(i)=1;	
    dsource2(i)=0;
  else			          	%信源输出"11"的概率为1/4
    dsource1(i)=1;
    dsource2(i)=1;
  end;
end;
%判决、误码率计算
numofsymbolerror=0;
numofbiterror=0;
for i=1:N,
  %在判决器的接收端的信号，对于第i个符号为：
  n(1)=bmgauss(sgma);	  	  
  n(2)=bmgauss(sgma);
  if ((dsource1(i)==0) & (dsource2(i)==0)),
    r=s00+n;                                                        %输入00则算出对应的总信号
  elseif ((dsource1(i)==0) & (dsource2(i)==1)),
    r=s01+n;                                                        %输入01则算出对应的总信号
  elseif ((dsource1(i)==1) & (dsource2(i)==0)),
    r=s10+n;                                                         %输入10则算出对应的总信号
  else
    r=s11+n;                                                          %输入11则算出对应的总信号
  end;
  % 以下为计算互相关量度
  c00=dot(r,s00);
  c01=dot(r,s01);
  c10=dot(r,s10);
  c11=dot(r,s11);
  % 第i个符号的判决如下进行
  c_max=max([c00 c01 c10 c11]);
  if (c00==c_max),
    decis1=0; decis2=0;
  elseif (c01==c_max),
    decis1=0; decis2=1;
  elseif (c10==c_max),
    decis1=1; decis2=0;
  else
    decis1=1; decis2=1;
  end;
  %若判决结果不正确，误码计数器加1
  symbolerror=0;
  if (decis1~=dsource1(i)),
    numofbiterror=numofbiterror+1;
    symbolerror=1;
  end;
  if (decis2~=dsource2(i)),
    numofbiterror=numofbiterror+1;
    symbolerror=1;
  end;
  if (symbolerror==1),
    numofsymbolerror = numofsymbolerror+1;
  end;
end;
ps=numofsymbolerror/N;	          	% 总共发出N个符号
pb=numofbiterror/(2*N);    	  	%总共发出2N个比特
