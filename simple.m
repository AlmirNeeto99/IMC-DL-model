L = 3;

x = [.1 .5];
expected = [.05 .95];

learningRate = 0.001;

w1 = [[0.1 0.2]; [0.3 0.4]];
b1 = 0.25;

w2 = [[0.5 0.7]; [0.6 0.8]];
b2 = 0.35;

SIZE = 10000
epochs = 1:1:SIZE;
y = zeros(1, SIZE);

for i = epochs

    z1 = (x * w1) + b1;
    a1 = sig(z1);

    z2 = (a1 * w2) + b2;
    a2 = sig(z2);

    err = 1/2 * (expected - a2).^2;

    errTotal = sum(err)
    y(i) = errTotal;

    dC = a2 - expected;
    dzL = a2 .* (1 - a2);

    deltaL_2 = dC .* dzL;

    dw2 = a1' * deltaL_2;

    deltaL_1 = (deltaL_2 * w2) .* (a1 .* (1 - a1));
    dw1 = x' * deltaL_1;
    w1 = w1 - learningRate * dw1;
    w2 = w2 - learningRate * dw2;
    b1 = b1 - learningRate * sum(deltaL_2);
    b2 = b2 - learningRate * sum(deltaL_1);

endfor

plot(epochs, y)
