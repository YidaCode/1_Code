function [f,amp] = cal_fft_analyse(fs,N,Input)
    fft_temp        =   fft(Input); 
    amp             =   abs(fft_temp/N);
    amp             =   amp(1:N/2+1);
    amp(2:end-1)    =   2*amp(2:end-1);
    f               =   fs*(0:(N/2))/N;
end 