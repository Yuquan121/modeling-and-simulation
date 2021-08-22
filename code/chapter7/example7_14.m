len = 10000; % 仿真符号数
M = 16; %16进制调制
msg = randint(len,1,M); %原始信号

% 分别使用PSK和PAM两种方式调制原始信号
txpsk = pskmod(msg,M);
txpam = pammod(msg,M);

%画原始信号星座图
scatterplot(txpsk);title('PSK Scatter Plot')
scatterplot(txpam); title('PAM Scatter Plot')

% 对已调信号加入相位干扰
phasenoise = randn(len,1)*.015;
rxpsk = txpsk.*exp(j*2*pi*phasenoise);
rxpam = txpam.*exp(j*2*pi*phasenoise);

%画出接收信号（受干扰的）星座图
scatterplot(rxpsk); title('Noisy PSK Scatter Plot')
scatterplot(rxpam); title('Noisy PAM Scatter Plot')

% 解调接收信号
recovpsk = pskdemod(rxpsk,M);
recovpam = pamdemod(rxpam,M);

% 分别计算两种调制方式下的误符号率
numerrs_psk = symerr(msg,recovpsk)
numerrs_pam = symerr(msg,recovpam)
