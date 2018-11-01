  
  w = 0:pi/1000:pi;
  alpha = 0.8;
  k=10;
  a= 1-alpha;
  b= zeros(1,k+1);
  b(1)=1
  b(k+1)=-alpha
  [h] = freqz(a, b, w);
  disp(Fs);

  figure();
  zplane(a, b);
  figure();
  freqz_plot(w*Fs/(2*pi), h);
  
  [x,Fs2] = audioread('tone-ramp.wav');
  y = filter(a,b,x);
  yfft=fft(y);
  figure();
  % Graficar en frecuencia la salida del audio
  plot(0:1/Fs2:(length(yfft)-1)/Fs2,y);
  audiowrite('filtered_audio.wav',y,Fs);
  n=length(x);
  y=zeros(n,1);
  for (idx=1:10)
      y(idx) = (1-alpha)*x(idx);
  end
  for (idx=11:n)
    y(idx) = (1-alpha)*x(idx)+alpha*y(idx-k);
  end
  figure();
  plot(0:1/Fs2:(length(yfft)-1)/Fs2,y);
  audiowrite('filtered_audio.wav');