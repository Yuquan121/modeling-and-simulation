function [p]= snr2ps6_11 (snr_in_dB)
% [p]= snr2ps6_11 (snr_in_dB)
%计算信噪比给定时的差错概率
% snr_in_dB——   信号噪声比（dB）
E=1;
SNR=exp(snr_in_dB*log(10)/10);	   	% 信号噪声比
sgma=E/sqrt(2*SNR);		                %定义噪声标准差
N=10000;                                                             %定义数据比特数

%产生二进制数据源
for i=1:N,                                                                
  temp=rand;   	      			% 产生一个（0,1）内的均匀量
  if (temp<0.5),
    dsource(i)=0;   	      %如果产生的随机数在（0,0.5）以内，二进制源的输出就是0
  else
    dsource(i)=1;	      	      %反之，二进制源的输出就是1
  end
end;

% 检测、计算差错概率
numoferr=0;
for i=1:N,
  % matched filter outputs
  if (dsource(i)==0),
    r0=E+bmgauss(sgma);
    r1=bmgauss(sgma);	      		% 如果二进制源的输出是 "0"
  else
    r0=bmgauss(sgma);
    r1=E+bmgauss(sgma);     		% 如果二进制源的输出是 "1"
  end;
  % Detector follows.
  if (r0>r1),
    decis=0;		      		% 判决为 "0".
  else
    decis=1;		      		% 判决为 "1".
  end;
  if (decis~=dsource(i)),    	%如果判决结果不等于二进制源输出结果，差错计数器加1
    numoferr=numoferr+1;
  end;
end;
p=numoferr/N;	  	      		%计算差错率
