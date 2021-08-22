function [enc_comp] = cm_dpske(E,M,mapping,sequence);
% [enc_comp] = cm_dpske(E,M,mapping,sequence)
% 求一个序列的差分编码		
% E表示平均能量，M是星座图中的点数（相数），mapping表示信息与星座图中各相信号点的映射关系，sequence是未经编码的二进制序列 
k=log2(M);                                               %M相信号需要k个比特来表示
N=length(sequence);
%若N序列长度不是k的整数倍，则在序列后补0 
remainder=rem(N,k);
if (remainder~=0),
  for i=N+1:N+k-remainder,
    sequence(i)=0;
  end;
  N=N+k-remainder;
end;
theta=0;				% 假定初始相位差为0.	
for i=1:k:N,
  index=0;
  for j=i:i+k-1,
    index=2*index+sequence(j);
  end;
  index=index+1;
  theta=mod(2*pi*mapping(index)/M+theta,2*pi);
  enc_comp((i+k-1)/k,1)=sqrt(E)*cos(theta);
  enc_comp((i+k-1)/k,2)=sqrt(E)*sin(theta);
end;
