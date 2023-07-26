s = 50000;

h = rand(s, 1) * 1 + 1;
w = rand(s, 1) * 50 + 50;

f = fopen('train.csv', 'w');

for i = 1:1:s
    imcC = imc(h(i), w(i));
    imcN = get_imc_neurons(imcC);
    fprintf(f, '%f,%f,%i,%i,%i,%i,%i\n', h(i), w(i), imcN);
endfor

fclose(f);

h = rand(s, 1) * 1 + 1;
w = rand(s, 1) * 50 + 50;

f = fopen('test.csv', 'w');

for i = 1:1:s
    imcC = imc(h(i), w(i));
    imcN = get_imc_neurons(imcC);
    fprintf(f, '%f,%f,%i,%i,%i,%i,%i\n', h(i), w(i), imcN);
endfor

fclose(f);
