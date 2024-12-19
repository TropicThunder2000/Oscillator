
%Oscillator Testscript
%Author - AdityaJeganath K
%Date - 03 / 18/ 2024

fs = 48000;
buffer_size = 4096;
f_o = 1000;

obj = oscillator_class(f_o,fs,buffer_size);

saw_wave = processsaw(obj);
figure;
subplot(2,1,1);
plot(saw_wave);
xlabel('Samples');
ylabel('Amplitude');
subplot(2,1,2);
spectrogram(saw_wave,1024,512,512,fs);
soundsc(saw_wave);
pause(5);

triangle_wave = processtriangle(obj);
figure;
subplot(2,1,1);
plot(triangle_wave);
xlabel('Samples');
ylabel('Amplitude');
subplot(2,1,2);
spectrogram(triangle_wave,1024,512,512,fs);
soundsc(triangle_wave);
pause(5);

sine_wave = processsine(obj);
figure;
subplot(2,1,1);
plot(sine_wave(1:100));
xlabel('Samples');
ylabel('Amplitude');
subplot(2,1,2);
spectrogram(sine_wave,1024,512,512,fs);
soundsc(sine_wave);
pause(5);

square_wave = processsquare(obj);
figure;
subplot(2,1,1);
plot(square_wave);
xlabel('Samples');
ylabel('Amplitude');
subplot(2,1,2);
spectrogram(square_wave,1024,512,512,fs);
soundsc(square_wave);
pause(5);

sine_modulated = sine_wave .* saw_wave;
figure;
subplot(2,1,1);
plot(sine_modulated);
xlabel('Samples');
ylabel('Amplitude');
subplot(2,1,2);
spectrogram(sine_modulated,1024,512,512,fs);
soundsc(sine_modulated);
