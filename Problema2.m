w = 0:pi/1000:pi;
f0 = 4000;
Fs= 48000;
w0 = 2*pi*f0/Fs;
r = 0.90;
b0 = r;

b = b0.*[1 -2*cos(w0) 1];
a = [1 -2*r*cos(w0) r^2];
[h] = freqz(b, a, w);

% Graficar la magnitud en escala lineal
figure();
plot(w*Fs/(2*pi), abs(h));

% Graficar el diagrama de Bode (en dB) y la fase
figure();
freqz_plot(w, h);

% Graficar polos y ceros en el plano Z
figure();
zplane(b, a);

[x,Fs2] = audioread('tone-ramp.wav');
disp(Fs2);
y = filter(b,a,x);
figure();
% Graficar en el tiemplo amplitud del audio
plot(x);
xfft=fft(x);
figure();
% Graficar en frecuencia la salida del audio
plot(0:length(xfft)-1,abs(xfft));
figure();
% Graficar en el tiempo la salida del filtro
plot(y);
figure();
% Graficar en el tiempo la salida del audio
plot(0:length(xfft)-1,abs(fft(y)));
audiowrite('filtered_audio.wav',y,Fs);