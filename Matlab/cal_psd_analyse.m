function [f,amp] = cal_fft_power(fs,N,Input)
    input_cxn       =   xcorr(Input,'unbiased');
    fft_temp        =   fft(input_cxn,N); 
    amp             =   abs(fft_temp);
    amp             =   amp(1:N/2+1);
    amp             =   10*log10(amp);
    f               =   fs*(0:(N/2))/N;
end 