w = 0:pi/1000:pi;
f0 = 1;
Fs= 20;
w0 = 2*pi*f0/Fs;
r = 1;
b0 = r;

b = b0;
a = [1 -2*r*cos(w0) r^2];
H = tf (b,a,1/Fs);
[h] = freqz(b, a, w);

% Graficar la magnitud en escala lineal
figure();
plot(w*Fs/(2*pi), abs(h));

% Graficar el diagrama de Bode (en dB) y la fase
figure();
freqz_plot(w*Fs/(2*pi), h);

% Graficar polos y ceros en el plano Z
figure();
zplane(b, a);

figure();

impulse(H);


